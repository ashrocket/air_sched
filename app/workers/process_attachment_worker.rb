# app/workers/process_attachment_worker.rb
require 'oag/process'
class ProcessAttachmentWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true

  sidekiq_options lock: {
        timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },      # you don't use user_id here thus the naming
        name:    proc { |message_id| "lock:attachmentmsgid:#{message_id}" } # no need to pass timeout - not used
      }

  # sidekiq_options lock: {
  #     timeout: 1200000,
  #     name:    proc { |message_id, timeout| "lock:attachmentmsgid:#{message_id}" }
  #   }
  def perform(message_id, timeout = nil)
  # def perform(message_id, timeout = 1200000)
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
    begin
      msg = Mastiff::Email::Message.get(message_id)
      report = OagReport.where(msg_id: message_id).first

      if AppSwitch.on?('autoload')

        if report and report.report_status.eql? 'uninitialized'
          report.load_status['autoload'] = true
          report.save

          report.process_attachment
          processor = Oag::Process.new


          key  = report.estimated_key

          unless key.is_a? ReportKey
            processor.finalize(report, 'rejected')
            report.report_status ='rejected'
            report.load_status['attachment_status'] = 'undefined or invalid report key'
            report.attachment_status = 'undefined or invalid report key'
            report.save

            Sidekiq::Logging.logger.info "Report rejected due to  undefined or invalid report key #{report.report_name}"

          end
          report.report_key = key.report_key if key
          if report and report.report_key and report.report_status.eql?  'uninitialized'
           report.report_status =  'queued'
           report.save
           ScheduleImportWorker.perform_async(report.id)
          end
        # Attachment might be stuck
        elsif report and
              !report.report_status.eql? 'uninitialized' and report.attachment_status != 'stored' and
              (Time.now - report.updated_at) < 1800
          report.report_status = 'uninitialized'
          ProcessAttachmentWorker.delay_for(3.minute).perform_async(message_id)
        end
      else
        Sidekiq::Logging.logger.info 'Process Attachment Worker, autoload is FALSE'
        if report
          report.load_status['autoload'] = false
          report.save
        else
          Sidekiq::Logging.logger.info "Process Attachment Worker, " +
                       "Report #{message_id} does not exist yet, delaying for 2 minutes"
          ProcessAttachmentWorker.delay_for(2.minute).perform_async(message_id)
        end

      end
    ensure
        lock.release!
      end
    else
      Sidekiq::Logging.logger.info "Process Attachment Worker, busy, delaying #{message_id} for 1 minute"
      ProcessAttachmentWorker.delay_for(3.minute).perform_async(message_id)
    end
    #Do Something here with the message
    #
  end
end