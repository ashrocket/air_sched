# app/workers/schedule_import_worker.rb

require 'sidekiq-lock'
require 'oag/process'
class ScheduleImportWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => 3, :backtrace => true
  sidekiq_options lock: { timeout: 1200000, name: 'lock-import-worker' }

  # sidekiq_options lock: {
  #       timeout: proc { |_, timeout = 1_200_000 | timeout * 2 }, #
  #       name: 'lock-import-worker'  # no need to pass timeout - not used
  # }
  def perform(report_id)
    Sidekiq::Logging.logger.info "Import Worker #{report_id}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        report = OagReport.find_by(id: report_id)
        Sidekiq::Logging.logger.info "Import Worker Lock acquired, processing #{report_id}: #{report.report_key}"

        if report and !report.complete
          processor = Oag::Process.new

          case report.report_status
            when /queued/
              Sidekiq::Logging.logger.info "Import Worker loading schedules #{report_id}: #{report.report_key}"
              if report.large_report?

                ScheduleLargeImportWorker.perform_async(report_id)
              else

                processor.import_oag_file(report)
              end
            when /schedules_loaded/

              Sidekiq::Logging.logger.info "Import Worker refreshing airports  #{report_id}: #{report.report_key}"
              processor.refresh_airports(report)
              report.save
              UpdateAirportsWorker.perform_async()

            when /airports_refreshed/

              Sidekiq::Logging.logger.info "Import Worker refreshing airlines  #{report_id}: #{report.report_key}"
              processor.refresh_airlines(report)
              report.save
              UpdateAirportsWorker.perform_async()

            when /airlines_refreshed/



              Sidekiq::Logging.logger.info "Import Worker refreshing direct flights  #{report_id}: #{report.report_key}"
              processor.refresh_direct_flights(report)
              report.save
            when /direct_flights_refreshed/

              Sidekiq::Logging.logger.info "Import Worker refreshing destinations   #{report_id}: #{report.report_key}"
              report.load_status[:destinations_map_status] = 'refreshing'
              processor.refresh_destinations(report)
              report.load_status[:destinations_map_status] = 'refreshed'
              WFilterDestinationsWorker(report_id)
              report.save
            when /destinations_refreshed/

              Sidekiq::Logging.logger.info "Import Worker refreshing cnx_pairs   #{report_id}: #{report.report_key}"
              processor.refresh_cnx_pairs(report)
              report.save
            when /connections_refreshed/

              Sidekiq::Logging.logger.info "Import Worker finalizing    #{report_id}: #{report.report_key}"
              report.save
              processor.finalize(report, 'processed')
              rkey = ReportKey.where(report_key: report.report_key).first_or_create
              rkey.active = true
              rkey.save
          end
          unless report.complete or report.large_report?
            ScheduleImportWorker.perform_async(report_id)
          end
        end
      ensure
        lock.release!
      end
    else
      report = OagReport.find_by(id: report_id)
      Sidekiq::Logging.logger.info "Import Worker, busy, delaying #{report_id} for 1 minute #{report.report_key}"
      ScheduleImportWorker.delay_for(3.minute).perform_async(report_id)
    end
    #Do Something here with the message
    #
  end
end