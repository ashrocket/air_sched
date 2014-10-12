# app/workers/process_attachment_worker.rb
require 'sidekiq-lock'
require 'oag/process'
class ScheduleLargeImportWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => 1, :backtrace => true
  sidekiq_options lock: { timeout: 2400000, name: 'lock-large-import-worker' }


  def perform(report_id)
    Sidekiq::Logging.logger.info "Large Import Worker #{report_id}"
    Rails.logger = Sidekiq::Logging.logger

    if lock.acquire!
      begin
        report = OagReport.find_by(id: report_id)
        Sidekiq::Logging.logger.info "Large Import Worker Lock acquired, processing #{report_id}: #{report.report_key}"
        if report and !report.complete
          processor = Oag::Process.new
          case report.report_status
            when /queued/
              processor.import_large_oag_file(report)
            when /importing/
              processor.import_large_oag_file(report)
              rkey = ReportKey.where(report_key: report.report_key).first_or_create
            when /schedules_loaded/
              processor.refresh_airports(report)
            when /airports_refreshed/
              processor.refresh_direct_flights(report)
            when /direct_flights_refreshed/
              processor.refresh_destinations(report)
            when /destinations_refreshed/
              processor.refresh_cnx_pairs(report)
            when /connections_refreshed/
              processor.finalize(report)
              rkey = ReportKey.where(report_key: report.report_key).first_or_create
              rkey.active = true
              rkey.save
              report.complete = true
          end
          report.save
          unless report.complete
            ScheduleLargeImportWorker.perform_async(report_id)
          end
        end
      ensure
        lock.release!
      end
    else
      report = OagReport.find_by(id: report_id)
      Sidekiq::Logging.logger.info "Large Import Worker, busy, delaying #{report_id} for 3 minute #{report}"
      ScheduleLargeImportWorker.delay_for(3.minute).perform_async(report_id)
    end
    #Do Something here with the message
    #
  end
end