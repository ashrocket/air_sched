# app/workers/process_attachment_worker.rb
require 'sidekiq-lock'
require 'oag/process'
class ScheduleImportWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true
  sidekiq_options lock: { timeout: 2400000, name: 'lock-import-worker' }


  def perform(report_id)
    Rails.logger.info "Import Worker #{report_id}"

    if lock.acquire!
      begin
        Rails.logger.info "Import Worker Lock acquired, processing #{report_id}"

        report = OagReport.find_by(id: report_id)
        if report and !report.complete
          processor = Oag::Process.new
          processor.import_oag_file(report)        if report.report_status.eql? 'queued'
          processor.refresh_airports(report)       if report.report_status.eql? 'schedules_loaded'
          processor.refresh_direct_flights(report) if report.report_status.eql? 'airports_refreshed'
          processor.refresh_destinations(report)   if report.report_status.eql? 'direct_flights_refreshed'
          processor.refresh_cnx_pairs(report)      if report.report_status.eql? 'destinations_refreshed'
          processor.finalize(report) if report.report_status.eql? 'connections_refreshed'
          report.save
          rkey = ReportKey.where(report_key: report.report_key).first_or_create
          rkey.active = true
          rkey.save
          report.complete = true
          report.save
        end
      ensure
        lock.release!
      end
    else
      Rails.logger.info "Import Worker, busy, delaying #{report_id} for 1 minute"
      ScheduleImportWorker.delay_for(1.minute).perform_async(report_id)
    end
    #Do Something here with the message
    #
  end
end