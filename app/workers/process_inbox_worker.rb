require 'sidekiq-lock'

class ProcessInboxWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker
  include Sidetiq::Schedulable
  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true
  sidekiq_options lock: { timeout: 600000, name: 'lock-inbox-worker' }

  recurrence { minutely(10) }

  def perform
    if lock.acquire!
      begin
          Mastiff::Email.process_inbox
          #msg_ids = Mastiff::Email.u_ids
          #msg_ids.each do |msg_id|
          #
          #  msg = Mastiff::Email::Message.get(message_id)
          #
          #  if msg.uploader and msg.stored_filename
          #       att_path = File.join( msg.uploader.store_dir,  msg.stored_filename)
          #
          #      report = OagReport.where(msg_id: message_id).first_or_create
          #      if report.report_status.eql?('uninitialized')
          #        report.attachment_path   = att_path
          #        report.attachment_status = File.exist?(att_path) ? 'stored' : 'unstored'
          #        report.load_status       = { email_status: 'cached', attachment_status: ''}
          #        report.received          = msg.header[:date]
          #        report.save
          #
          #        unless report.load_status["attachment_status"].eql?('uncompressed')
          #            report.process_oag_file
          #            report.report_status =  'queued' if report.report_status.eql? 'uninitialized'
          #            report.save
          #        end
          #      end
          #  end
          #end

      ensure
        lock.release!
      end
    end
  end
end