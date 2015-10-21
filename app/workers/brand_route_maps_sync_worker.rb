# app/workers/brand_route_maps_export_worker.rb
require 'sidekiq-lock'

class BrandRouteMapsSyncWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => false, :backtrace => true

  sidekiq_options lock: {
         timeout: 1_200_000,
         name:   'lock-brand-route-maps-sync-worker'
  }



  def perform(options)
    brand_key        = options['brand_key']
    schedule_set_id  = options['schedule_set_id']
    report_key       = options['report_key']
    export_report_id = options['export_report_id']

    Sidekiq::Logging.logger.info "BrandRouteMapsSyncWorker called for  #{brand_key} #{report_key} #{schedule_set_id} #{export_report_id}"
    Rails.logger = Sidekiq::Logging.logger

    if lock.acquire!
      begin
        brand         = Brand.find_by(brand_key: brand_key)

        if export_report_id
            active_report = BrandRouteMapExportReport.find(export_report_id)
        else
            active_report =  brand.active_export_report
            active_report =  brand.next_export_report unless active_report
            export_report_id = active_report.id
        end

        if active_report.uninitialized?
          Rails.logger.info "RouteMapExportReport(#{brand_key}) - found uninitialized, kicking off state machine"
          active_report.set_ready_key(report_key, schedule_set_id) if report_key
          active_report.verify_report_keys!

        elsif active_report.waiting_for_report_keys?
          Rails.logger.info "RouteMapExportReport(#{brand_key}) - found waiting_for_report_keys, checking for timeout"
          active_report.set_ready_key(report_key, schedule_set_id) if report_key
          active_report.verify_report_keys!
        else
            if export_report_id
              Rails.logger.info "RouteMapExportReport(#{brand_key}) - leftover worker.  Stopping."

            else
              Rails.logger.info "!!! RouteMapExportReport(#{brand_key}) already in-progress, " +
                                "delaying second execution for 1 hour"

              BrandRouteMapsSyncWorker.delay_for(1.hour).perform_async(options)
            end
        end
      ensure
          lock.release!
      end
    else
      delay_val = (5..60).to_a.sample
      Sidekiq::Logging.logger.info "BrandRouteMapsSyncWorker, busy, delaying #{brand_key} for #{delay_val} seconds."

      BrandRouteMapsSyncWorker.delay_for(delay_val.seconds).perform_async(options)
    end
  end
end


# report_key = ReportKey.find_by(code: expected_report_key)
#      if report_key.idle? report_key.schedules_active?
#        self.schedule_report_keys[report_key.code] = {'status': 'ready', 'seq': report_key.current_seq}
#      end
#      schedule_report_keys[expected_report_key]['status'].eql? 'ready'