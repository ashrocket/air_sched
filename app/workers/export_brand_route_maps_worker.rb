# app/workers/export_brand_route_maps_worker.rb
require 'sidekiq-lock'

class ExportBrandRouteMapsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true, unique: true,
                  unique_job_expiration: 120 * 60,
                  unique_args: ->(args) { [ args.first ] },
                  lock: {
                  timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },
                  name: 'lock-export-brand-route-maps-worker'
                  }



  def perform(brand_key, report_id)
    Sidekiq::Logging.logger.info "ExportBrandRouteMapsWorker called with  #{brand_key}, #{report_id}"

    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        Sidekiq::Logging.logger.info "ExportBrandRouteMapsWorker checking if Export is Ready for  #{brand_key}"
        report = ExportSmartRouteReport.find(report_id)
        Sidekiq::Logging.logger.info "ExportBrandRouteMapsWorker found report:  #{brand_key}, #{report.id}: #{report.current_state.name}"

        if report and not report.exported?
            Sidekiq::Logging.logger.info "ExportBrandRouteMapsWorker: #{brand_key}, #{report.id}: advancing state."

            report.advance_state!
        end


      ensure
          lock.release!
      end
    else
      delay_val = (300..900).to_a.sample

      Sidekiq::Logging.logger.info "ExportBrandRouteMapsWorker, busy, delaying #{brand_key} for #{delay_val} seconds."
      ExportBrandRouteMapsWorker.delay_for(delay_val.seconds).perform_async(brand_key, report_id)
    end
    #Do Something here with the message
    #
  end
end