# app/workers/sync_attachment_worker.rb
class SyncAttachmentWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :email_queue, :retry => 1, :backtrace => true

  def perform(message_id)
    msg = Mastiff::Email::Message.get(message_id)

    if msg.uploader and msg.stored_filename
         attachment_path = File.join( msg.uploader.store_dir,  msg.stored_filename)
    end
    report = OagReport.first_or_create(msg_id: message_id, msg_status: 'received', filepath: attachment_path)
    report.received   = Time.now
    report.mail_type  ='unknown'
    report.save

    msg.sync_message_attachments
  end
end
