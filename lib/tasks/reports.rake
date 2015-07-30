include Rake::DSL
namespace :reports do


  desc "Reset OAG reports and Email Queue"
  task :reset_oag => :environment do |t, args|
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


  desc "Build Smart Routes"
  task :build_routes => :environment do |t, args|
    # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
    b = Brand.first
    r = Oag::Report.new
    r.build_routes(b)

  end

  desc "Build Smart Connections"
  task :build_connections => :environment do |t, args|
    # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
    b = Brand.first
    r = Oag::Report.new
    r.build_brand_connections(b)

  end

  desc "Build Smart Connection Templates"
  task :build_connection_templates => :environment do |t, args|
    # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
    b = Brand.first
    r = Oag::Report.new
    r.build_brand_connection_templates(b)

  end

  desc "Build Smart Operating Connection Templates"
  task :build_op_connection_templates => :environment do |t, args|
    # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
    b = Brand.first
    r = Oag::Report.new
    r.build_brand_op_connection_templates(b)

  end

  desc "Build Smart Market Routes"
  task :build_market_smart_routes => :environment do |t, args|
    # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
    brand = Brand.first
    r = Oag::Report.new


    # origin = 'TPE'
    # dest   = 'SYD'
    # r.build_brand_market_routes(b, origin, dest)

    r.build_brand_market_smart_routes(brand)

    # bc = BrandConnection.first
    # bc.to_market_request

  end
end    