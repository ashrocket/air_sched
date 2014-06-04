# app/workers/sync_attachment_worker.rb
class SyncAttachmentWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :email_queue, :retry => 1, :backtrace => true

  def perform(message_id)
    msg = Mastiff::Email::Message.get(message_id)

    if msg.uploader and msg.stored_filename
         attachment_path = File.join( msg.uploader.store_dir,  msg.stored_filename)
    end
    report = OagReport.where(msg_id: message_id).first_or_create(attachment_path: attachment_path)
    report.load_status  = { email_status: 'cached', attachment_status: 'unstored', report_status: 'queued'}
    report.received   = Time.now
    report.save

    msg.sync_message_attachments
  end
end
