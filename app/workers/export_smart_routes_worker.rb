# app/workers/export_smart_routes_worker.rb

require 'oag/exporters/smart_routes_exporter'
require 'sidekiq-lock'

class ExportSmartRoutesWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker
  include Sidetiq::Schedulable

  sidekiq_options :queue => :report_queue, :retry => 1, :backtrace => true
  # sidekiq_options lock: { timeout: 1200000, name: 'lock-export-smart-routes-worker' }

  sidekiq_options lock: {
        timeout: proc { |_, timeout = 1_200_000 | timeout * 2 }, #
        name: 'lock-export-smart-routes-worker'  # no need to pass timeout - not used
  }

  recurrence { daily(1) }


  def perform(brand_key)
    Sidekiq::Logging.logger.info "Smart Routes Worker #{brand_key}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        Sidekiq::Logging.logger.info "Smart Routes Worker pretending to Export #{brand_key}"
        brands = Brand.all
        brands.each do |brand|
          @export_report = ExportSmartRouteReport.create(brand: brand, status: 'started')
          exporter = Oag::SmartRoutesExporter.new
          url = exporter.export_to_s3(brand)
          @export_report.status = 'exported'
          @export_report.location = url.to_s

          @export_report.save

        end


      ensure
          lock.release!
      end
    else
      Sidekiq::Logging.logger.info "Smart Routes Worker, busy, delaying #{brand_key} for 3 minutes."
      ExportSmartRoutesWorker.delay_for(3.minute).perform_async(brand_key)
    end
    #Do Something here with the message
    #
  end
end