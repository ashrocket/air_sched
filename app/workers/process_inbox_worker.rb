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
      ensure
        lock.release!
      end
    end
  end
end