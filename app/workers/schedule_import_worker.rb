# app/workers/schedule_import_worker.rb

require 'sidekiq-lock'
class ScheduleImportWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true
  sidekiq_options lock: { timeout: 1200000, name: 'lock-import-worker' }


  sidekiq_retries_exhausted do |msg|
    Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  end


  def perform(report_id)
    Sidekiq::Logging.logger.info "Import Worker #{report_id}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        report = ScheduleSet.find_by(id: report_id)

        if report
          Sidekiq::Logging.logger.info "Import Worker Lock acquired, processing #{report_id}: #{report.report_key_code}"

          report.advance_state!

        end
      ensure
        lock.release!
      end
    else
      report = ScheduleSet.find_by(id: report_id)
      dly = (10..180).to_a.sample

      Sidekiq::Logging.logger.info "Import Worker, busy, check back on  #{report_id} in #{dly} seconds #{report.report_key_code}"
      ScheduleImportWorker.delay_for(dly).perform_async(report_id)
    end

  end

end