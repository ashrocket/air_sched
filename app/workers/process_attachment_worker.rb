# app/workers/process_attachment_worker.rb
require 'oag/process'
class ProcessAttachmentWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true

  def perform(message_id)
    Rails.logger = Sidekiq::Logging.logger
    if AppSwitch.on?('autoload')
      msg = Mastiff::Email::Message.get(message_id)

      report = OagReport.where(msg_id: message_id).first
      if report
        unless report.load_status["attachment_status"].eql?('uncompressed')
          report.process_oag_file
          report.report_status =  'queued' if report.report_status.eql? 'uninitialized'
          report.save
        end
        ScheduleImportWorker.perform_async(report.id)
      end
    end

    #Do Something here with the message
    #
  end
end