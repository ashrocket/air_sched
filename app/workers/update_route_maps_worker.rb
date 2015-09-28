# app/workers/update_route_maps_worker.rb
require 'sidekiq-lock'
class UpdateRouteMapsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true,
                  lock: { timeout: 1200000, name: 'lock-route-maps-worker' }


  def perform(brand_key)
    Sidekiq::Logging.logger.info "UpdateRouteMapsWorker  #{brand_key}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        brand = Brand.keyed(brand_key)
        seg_counts_array = [*1..brand.max_segments]
        r = Oag::Report.new
        r.build_brand_route_maps(brand, seg_counts_array)


      ensure
        lock.release!
      end
    else
      delay_time = 20

      Sidekiq::Logging.logger.info "UpdateRouteMapsWorker, busy, check back on  #{brand_key} in #{delay_time} minutes."
      UpdateRouteMapsWorker.delay_for(delay_time.minute).perform_async(brand_key)
    end

  end

end