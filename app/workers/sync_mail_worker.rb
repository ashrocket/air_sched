# app/workers/sync_mail_worker.rb

require 'sidekiq-lock'

class SyncMailWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker
  include Sidetiq::Schedulable
  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true
  sidekiq_options lock: { timeout: 120000, name: 'lock-mail-worker' }

  recurrence { hourly.minute_of_hour(0, 10, 20, 30, 40, 50) }
  # recurrence { secondly(6) }

  def perform
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        Mastiff::Email.sync_messages
      rescue Net::IMAP::Error => e
        Sidekiq::Logging.logger.info e.message
        Sidekiq::Logging.logger.info e.backtrace.inspect
      ensure
        lock.release!
      end
    end
  end
end