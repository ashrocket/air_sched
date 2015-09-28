# app/workers/brand_route_maps_export_worker.rb
require 'sidekiq-lock'

class ExportBrandRouteMapValidatorWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true,
                  lock: {
                  timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },
                  name: 'lock-export-brand-route-map-validator-worker'
                  }



  def perform(brand_key, report_id)
    Sidekiq::Logging.logger.info "ExportBrandRouteMapValidatorWorker called with  #{brand_key}, #{report_id}"

    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        Sidekiq::Logging.logger.info "ExportBrandRouteMapValidatorWorker checking if Export is Ready for  #{brand_key}"
        report = ExportRouteValidatorReport.find(report_id)
        Sidekiq::Logging.logger.info "ExportBrandRouteMapValidatorWorker found report:  #{brand_key}, #{report.id}: #{report.current_state.name}"

        if report and not report.exported?
            Sidekiq::Logging.logger.info "ExportBrandRouteMapValidatorWorker: #{brand_key}, #{report.id}: advancing state."

            report.advance_state!
        end


      ensure
          lock.release!
      end
    else
      delay_val = (300..900).to_a.sample

      Sidekiq::Logging.logger.info "ExportBrandRouteMapValidatorWorker, busy, delaying #{brand_key} for #{delay_val} seconds."
      ExportBrandRouteMapValidatorWorker.delay_for(delay_val.seconds).perform_async(brand_key, report_id)
    end
    #Do Something here with the message
    #
  end
end