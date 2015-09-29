# app/workers/schedule_large_import_worker.rb

require 'sidekiq-lock'
class ScheduleLargeImportWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true
  sidekiq_options lock: { timeout: 2400000, name: 'lock-large-import-worker' }


  sidekiq_retries_exhausted do |msg|
    Sidekiq.logger.warn "Failed #{msg['class']} with #{msg['args']}: #{msg['error_message']}"
  end


  def perform(report_id)
    Sidekiq::Logging.logger.info "Large Import Worker #{report_id}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        report = ScheduleSet.find_by(id: report_id)

        if report
          Sidekiq::Logging.logger.info "Large Import Worker Lock acquired, processing #{report_id}: #{report.report_key_code}"

          report.advance_state!

        end
      ensure
        lock.release!
      end
    else
      report = ScheduleSet.find_by(id: report_id)
      timeout_minutes = lock.timeout/60_000
      delay_time = timeout_minutes/6

      Sidekiq::Logging.logger.info "Import Worker, busy, check back on  #{report_id} in #{delay_time} minutes #{report.report_key_code}"
      ScheduleLargeImportWorker.delay_for(delay_time.minute).perform_async(report_id)
    end

  end

end