#require 'sidekiq-lock'
#
#class ProcessReportsWorker
#  include Sidekiq::Worker
#  include Sidekiq::Lock::Worker
#  include Sidetiq::Schedulable
#  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true
#  sidekiq_options lock: { timeout: 1000, name: 'lock-worker' }
#
#  recurrence { minutely(10) }
#
#  def perform
#    if lock.acquire!
#      stalled_reports = OagReport.where()
#
#    end
#  end
#end
