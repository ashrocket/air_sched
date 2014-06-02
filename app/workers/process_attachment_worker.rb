# app/workers/process_attachment_worker.rb
require 'oag/process'
class ProcessAttachmentWorker
  include Sidekiq::Worker

  def perform(message_id)
    msg = Mastiff::Email::Message.get(message_id)

    report = OagReport.where(msg_id: message_id).first
    if report
      report.filesize = File.stat(report.filepath).size
      report.save
      Oag::Process.process_oag_file(report)

    end

    #Do Something here with the message
    #
  end
end