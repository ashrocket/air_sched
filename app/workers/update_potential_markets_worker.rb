# app/workers/update_brand_connection_worker.rb

require 'sidekiq-lock'
class UpdatePotentialMarketsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true,
                  lock: { timeout: 1200000, name: 'lock-update-potential-markets-worker' }


  def perform(brand_key)
    Sidekiq::Logging.logger.info "UpdatePotentialMarketsWorker  #{brand_key}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        brand = Brand.find_by(brand_key: brand_key)
        r = Oag::Report.new
        r.build_potential_markets(brand)

      ensure
        lock.release!
      end
    else
      delay_time = 20
      Sidekiq::Logging.logger.info "UpdatePotentialMarketsWorker, busy, check back on  #{brand_key} in #{delay_time} minutes."
      UpdatePotentialMarketsWorker.delay_for(20).perform_async(brand_key)
    end

  end

end