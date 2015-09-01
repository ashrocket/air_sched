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

  def perform(message_id, timeout = nil)
    Rails.logger = Sidekiq::Logging.logger

    if lock.acquire!
    begin
      msg = Mastiff::Email::Message.get(message_id)
      report = OagReport.where(msg_id: message_id).first
      Sidekiq::Logging.logger.info "Process Attachment Worker, autoload => #{AppSwitch.on?('autoload')}"
      if report and AppSwitch.on?('autoload')

        report.load_status['autoload'] = true
        report.save
        report.process_attachment!

      elsif report

          report.load_status['autoload'] = false
          report.save

      else
          err_string = "Process Attachment Worker - Report #{message_id} does not exist yet!"
          Sidekiq::Logging.logger.info err_string
          raise(err_string)
      end
    ensure
        lock.release!
      end
    else
      Sidekiq::Logging.logger.info "Process Attachment Worker, busy, delaying #{message_id} for 1 minute"
      ProcessAttachmentWorker.delay_for(3.minute).perform_async(message_id)
    end


  end
end