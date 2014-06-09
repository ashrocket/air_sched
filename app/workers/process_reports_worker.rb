#require 'sidekiq-lock'
#
#class ProcessInboxWorker
#  include Sidekiq::Worker
#  include Sidekiq::Lock::Worker
#  include Sidetiq::Schedulable
#  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true
#  sidekiq_options lock: { timeout: 600000, name: 'lock-reports-worker' }
#
#  recurrence { minutely(10) }
#
#  def perform
#    if lock.acquire!
#      begin
#       incomplete_reports = OagReport.incomplete
#       incomplete_reports.each do |report|
#         ScheduleImportWorker.perform_async(report.id)
#       end
#      ensure
#        lock.release!
#      end
#    end
#  end
#end