# app/workers/brand_route_maps_export_worker.rb
require 'sidekiq-lock'

class BrandRouteMapsExportWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true,
                  lock: {
                  timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },
                  name: 'lock-brand-route-maps-export-worker'
                  }



  def perform(brand_key, report_id)
    Sidekiq::Logging.logger.info "BrandRouteMapsExportWorker called with  #{brand_key}, #{report_id}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        Sidekiq::Logging.logger.info "BrandRouteMapsExportWorker checking if Export is Ready for  #{brand_key}"
        export_report = BrandRouteMapExportReport.find(report_id)
        Sidekiq::Logging.logger.info "BrandRouteMapsExportWorker found report:  #{brand_key}, #{export_report.id}: #{export_report.current_state.name}"
        if export_report and not export_report.exported?
            Sidekiq::Logging.logger.info "BrandRouteMapsExportWorker: #{brand_key}, #{export_report.id}: advancing state."

            export_report.advance_state!
        end


      ensure
          lock.release!
      end
    else
      delay_val = (30..300).to_a.sample
      Sidekiq::Logging.logger.info "BrandRouteMapsExportWorker, busy, delaying #{brand_key} for #{delay_val} seconds."
      BrandRouteMapsExportWorker.delay_for(delay_val.seconds).perform_async(brand_key, report_id)
    end
    #Do Something here with the message
    #
  end
end