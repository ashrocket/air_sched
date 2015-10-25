# app/workers/update_smart_routes_worker.rb

require 'sidekiq-lock'
class UpdateSmartRoutesWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true,
                  lock: { timeout: 1200000, name: 'lock-smart-routes-worker' }


  def perform(brand_key)
    Sidekiq::Logging.logger.info "UpdateSmartRoutesWorker  #{brand_key}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        brand = Brand.keyed(brand_key)
        seg_counts_array = [*1..brand.settings.max_segments]

        r = Oag::Report.new
        r.build_brand_market_smart_routes(brand, seg_counts_array)
        # For debugging Three Segment Routes, this is faster
        # r.build_brand_market_smart_routes(brand, [3])
        #

      ensure
        lock.release!
      end
    else
      delay_time = 20

      Sidekiq::Logging.logger.info "UpdateSmartRoutesWorker, busy, check back on  #{brand_key} in #{delay_time} minutes."
      UpdateSmartRoutesWorker.delay_for(delay_time.minute).perform_async(brand_key)
    end

  end

end