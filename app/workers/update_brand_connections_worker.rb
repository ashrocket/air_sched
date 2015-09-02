# app/workers/update_brand_connection_worker.rb

require 'sidekiq-lock'
class UpdateBrandConnectionsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true, unique: true,
                  unique_args: ->(args) { [ args.first ] },
                  lock: { timeout: 1200000, name: 'lock-brand-connections-worker' }


  def perform(brand_key)
    Sidekiq::Logging.logger.info "UpdateBrandConnectionsWorker  #{brand_key}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        brand = Brand.find_by(brand_key: brand_key)
        r = Oag::Report.new
        r.build_brand_connections(brand)

      ensure
        lock.release!
      end
    else
      delay_time = 20

      Sidekiq::Logging.logger.info "UpdateBrandConnectionsWorker, busy, check back on  #{brand_key} in #{delay_time} minutes."
      UpdateBrandConnectionsWorker.delay_for(delay_time.minute).perform_async(brand_key)
    end

  end

end