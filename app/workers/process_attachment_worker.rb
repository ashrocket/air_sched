# app/workers/process_attachment_worker.rb
require 'oag/process'
class ProcessAttachmentWorker
  include Sidekiq::Worker

  def perform(message_id)
    msg = Mastiff::Email::Message.get(message_id)

    report = OagReport.where(msg_id: message_id).first
    if report
      Oag::Process.process_oag_file(report)
      ScheduleImportWorker.perform_async(report.id)
    end

    #Do Something here with the message
    #
  end
end