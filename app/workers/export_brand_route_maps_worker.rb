# app/workers/export_brand_route_maps_worker.rb
require 'sidekiq-lock'

class ExportBrandRouteMapsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true, unique: true,
                  unique_args: ->(args) { [ args.first ] },
                  lock: {
                  timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },
                  name: 'lock-export-brand-route-maps-worker'
                  }



  def perform(brand_key, report_id)

    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        Sidekiq::Logging.logger.info "Smart Routes Worker checking if Export is Ready for  #{brand_key}"
        report = ExportSmartRouteReport.find(report_id)
        if report and not report.exported?
            report.advance_state!
        end


      ensure
          lock.release!
      end
    else
      delay_val = (300..900).to_a.sample

      Sidekiq::Logging.logger.info "Smart Routes Worker, busy, delaying #{brand_key} for #{delay_val} seconds."
      ExportBrandRouteMapsWorker.delay_for(delay_val.seconds).perform_async(brand_key, report_id)
    end
    #Do Something here with the message
    #
  end
end