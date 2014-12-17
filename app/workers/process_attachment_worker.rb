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
      if AppSwitch.on?('autoload')
        msg = Mastiff::Email::Message.get(message_id)
        report = OagReport.where(msg_id: message_id).first
        if report and report.report_status.eql? 'uninitialized'
          report.process_attachment
          processor = Oag::Process.new

          report.report_key  = report.estimated_key

          if report.report_key

            key = ReportKey.where(report_key: report.report_key)
            if key.blank?
              processor.finalize(report)
              report.report_status ='rejected'
              report.load_status['attachment_status'] = "no matching report key #{report.report_key} "
              report.attachment_status =  "no matching report key #{report.report_key} "
              report.save
            end
          else
            processor.finalize(report)
            report.report_status ='rejected'
            report.load_status['attachment_status'] = 'invalid report key'
            report.attachment_status = 'invalid report key'
          end

         if report and report.report_key and report.report_status.eql?  'uninitialized'
           report.report_status =  'queued'
           report.save
           ScheduleImportWorker.perform_async(report.id)
         end
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