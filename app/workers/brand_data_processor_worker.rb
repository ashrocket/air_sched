require 'sidekiq-lock'
class BrandDataProcessorWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true,
                  lock: { timeout: 1200000, name: 'lock-brand-data-processor-worker' }


  def perform(brand_key, data_action)
    Sidekiq::Logging.logger.info "BrandDataProcessorWorker  #{brand_key}, #{data_action}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        brand = Brand.find_by(brand_key: brand_key)
        r = Oag::Report.new
        case data_action
          when 'build_connections'
            r.build_brand_connections(brand)
          when 'build_smart_routes'
            seg_counts_array = [*1..brand.settings.max_segments]
            r.build_brand_smart_routes(brand,seg_counts_array)
          when 'build_route_maps'
            seg_counts_array = [*1..brand.settings.max_segments]
            r.build_brand_route_maps(brand,seg_counts_array)
          when 'export_route_maps'
            r.export_route_maps(brand)
        end

      ensure
        lock.release!
      end
    else
      delay_time = 5
      Sidekiq::Logging.logger.info "BrandDataProcessorWorker, busy, check back on  #{brand_key} #{data_action} in #{delay_time} minutes."
      BrandDataProcessorWorker.delay_for(delay_time.minute).perform_async(brand_key,data_action)
    end

  end

end