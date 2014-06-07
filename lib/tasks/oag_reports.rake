include Rake::DSL
namespace :oag_reports do


  desc "Reset OAG reports and Email Queue"
  task :reset => :environment do |t, args|
    OagReport.delete_all
    Rake::Task["mastiff:reset"].invoke
    email_queue = Sidekiq::Queue.new("email_queue")
    report_queue = Sidekiq::Queue.new("report_queue")
    #
    email_queue.clear
    report_queue.clear
    Sidekiq.redis do |conn|
      workers = conn.smembers('workers')
      conn.srem('workers', workers) if !workers.empty?
    end

 end
end    