# app/workers/process_attachment_worker.rb
require 'sidekiq-lock'
require 'oag/process'
class ScheduleImportWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true
  sidekiq_options lock: { timeout: 1200000, name: 'lock-import-worker' }


  def perform(report_id)
    Rails.logger.info "Import Worker #{report_id}"

    if lock.acquire!
      begin
        Rails.logger.info "Import Worker Lock acquired, processing #{report_id}"

        report = OagReport.find_by(id: report_id)
        if report and !report.complete
          processor = Oag::Process.new
          case report.report_status
            when /queued/
              processor.import_oag_file(report)
              rkey = ReportKey.where(report_key: report.report_key).first_or_create
              report.save
            when /schedules_loaded/
              processor.refresh_airports(report)
              report.save
            when /airports_refreshed/
              processor.refresh_direct_flights(report)
              report.save
            when /direct_flights_refreshed/
              processor.refresh_destinations(report)
              report.save
            when /destinations_refreshed/
              processor.refresh_cnx_pairs(report)
              report.save
            when /connections_refreshed/
              report.save
              processor.finalize(report)
              rkey = ReportKey.where(report_key: report.report_key).first_or_create
              rkey.active = true
              rkey.save
              report.complete = true
              report.save
          end
          unless report.complete
            ScheduleImportWorker.perform_async(report_id)
          end
        end
      ensure
        lock.release!
      end
    else
      report = OagReport.find_by(id: report_id)
      Sidekiq::Logging.logger.info "Import Worker, busy, delaying #{report_id} for 1 minute #{report}"
      ScheduleImportWorker.delay_for(3.minute).perform_async(report_id)
    end
    #Do Something here with the message
    #
  end
end