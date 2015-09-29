# app/workers/sync_attachment_worker.rb

class SyncAttachmentWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true,
        lock: {
          timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },
          name:    proc { |message_id| "lock:sync-attachmentmsgid:#{message_id}" } # no need to pass timeout - not used
        }

  def perform(message_id)
    Rails.logger = Sidekiq::Logging.logger


    if lock.acquire!
      begin

        msg = Mastiff::Email::Message.get(message_id)

        if msg.uploader and msg.stored_filename
             att_path = File.join( msg.uploader.store_dir,  msg.stored_filename)
        end
        report = ScheduleSet.where(msg_id: message_id).first
        if report
          Sidekiq::Logging.logger.info "Sync Attachment Worker ==> EXISTING Import Report found for #{message_id} #{report.id}"
          report.reset!
        else
          report = ScheduleSet.create(msg_id: message_id)
          Sidekiq::Logging.logger.info "Sync Attachment Worker  -> New Import Report created for #{message_id} #{report.id}"
        end

        if report.uninitialized?
          report.attachment_path   = att_path
          report.attachment_status = File.exist?(att_path) ? 'stored' : 'unstored'
          report.attachment_lines  = %x{wc -l < "#{att_path}"}.to_i  if File.exist?(att_path)
          report.load_status.merge!( email_status: 'cached', attachment_status: '')
          report.received          = msg.header[:date]
          report.save

          # From Here Mastiff  pulls the file down onto the local filesystem.
          # and then calls the Process Attachment Worker asynchronousely to
          # kick of unzipping and other elements before loading the CSV.
          if  File.exist?(att_path)
            Sidekiq::Logging.logger.info "Sync Attachment Worker ==> Email Attachment #{report.report_name} EXISTS for report #{report.id} #{message_id} "
          end
          msg.sync_message_attachments
          report.attachment_lines = %x{wc -l < "#{att_path}"}.to_i  if File.exist?(att_path)
          report.save
          Sidekiq::Logging.logger.info "Sync Attachment Worker  -> Email Attachment #{report.report_name} sync'd for report #{report.id} #{message_id} "

        else
          # Push Existing Report to try to finish
          ScheduleImportWorker.perform_async(id)
        end
      ensure
        lock.release!
      end
    else
      timeout_minutes = lock.timeout/60_000
      delay_time = timeout_minutes/4

      Sidekiq::Logging.logger.info "Sync Attachment Worker => busy.  Delaying #{message_id} for #{delay_time} minutes"
      ProcessAttachmentWorker.delay_for(delay_time.minute).perform_async(message_id)
    end #End lock.acquire!
  end
  #End perform



end
