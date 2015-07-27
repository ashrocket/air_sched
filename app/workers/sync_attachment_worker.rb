# app/workers/sync_attachment_worker.rb

class SyncAttachmentWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :email_queue, :retry => 1, :backtrace => true

  def perform(message_id)
    Rails.logger = Sidekiq::Logging.logger
    msg = Mastiff::Email::Message.get(message_id)

    if msg.uploader and msg.stored_filename
         att_path = File.join( msg.uploader.store_dir,  msg.stored_filename)
    end
    report = OagReport.where(msg_id: message_id).first_or_create
    report.attachment_path   = att_path
    report.attachment_status = File.exist?(att_path) ? 'stored' : 'unstored'
    report.attachment_lines  = %x{wc -l < "#{att_path}"}.to_i  if File.exist?(att_path)
    report.load_status       = { email_status: 'cached', attachment_status: ''}
    report.received          = msg.header[:date]
    report.save

    msg.sync_message_attachments
    report.attachment_lines = %x{wc -l < "#{att_path}"}.to_i  if File.exist?(att_path)
    report.save

  end
end
