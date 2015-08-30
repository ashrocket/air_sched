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


  # desc "Build Smart Routes"
  # task :build_routes => :environment do |t, args|
  #   # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
  #   b = Brand.first
  #   r = Oag::Report.new
  #   r.build_routes(b)
  #
  # end



  # desc "Build Smart Connection Templates"
  # task :build_connection_templates => :environment do |t, args|
  #   # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
  #   b = Brand.first
  #   r = Oag::Report.new
  #   r.build_brand_connection_templates(b)
  #
  # end

  # desc "Build Smart Operating Connection Templates"
  # task :build_op_connection_templates => :environment do |t, args|
  #   # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
  #   b = Brand.first
  #   r = Oag::Report.new
  #   r.build_brand_op_connection_templates(b)
  #
  # end
  desc "Build Smart Connections"
   task :build_connections, [:brands] => :environment do |t, args|
     ActiveRecord::Base.logger.level = Logger::INFO
     args.with_defaults(:brands => ['TZ'])
     brand_keys = args[:brands].split ' '
     brand_keys.each do |brand_key|
       brands = Brand.where(brand_key: brand_key)
       if brands.count > 0
         b = brands.first
         r = Oag::Report.new

         r.build_brand_connections(b)
       end
     end
   end


  desc "Build Smart Market Routes"
  task :build_market_smart_routes, [:seg_count_array, :brands] => :environment do |t, args|
    ActiveRecord::Base.logger.level = Logger::INFO
    args.with_defaults(:seg_count_array => [1,2,3], :brands => ['TZ'])

    seg_counts =  (args[:seg_count_array].split ' ').map{|c| c.to_i}
    brand_keys = args[:brands].split ' '

    brand_keys.each do |brand_key|

      brand = Brand.keyed(brand_key).first
      r = Oag::Report.new
      r.build_brand_market_smart_routes(brand, seg_counts)

    end

  end

  desc "Build Smart Market Route Maps"
   task :build_market_route_maps => :environment do |t, args|
     ActiveRecord::Base.logger.level = Logger::INFO

     # b = Brand.create(brand_key: "TZ", name: "Scoot", report_keys: ["TZTRDDXW"], description: "Scoot Interline Network")
     brand = Brand.first
     r = Oag::Report.new


     # origin = 'TPE'
     # dest   = 'SYD'
     # r.build_brand_market_routes(b, origin, dest)

     r.build_brand_route_maps(brand)

     # bc = BrandConnection.first
     # bc.to_market_request

   end

end    