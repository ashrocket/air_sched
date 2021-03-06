# app/workers/filter_destinations_worker.rb

require 'sidekiq-lock'
require 'oag/process'
class FilterDestinationsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker

  sidekiq_options :queue => :report_queue, :retry => 1, :backtrace => true
  sidekiq_options lock: { timeout: 2_400_000, name: 'lock-filter-destinations-worker' }

  # sidekiq_options lock: {
  #       timeout: proc { |_, timeout = 1_200_000 | timeout * 2 }, #
  #       name: 'lock-filter-destinations-worker' # no need to pass timeout - not used
  # }
  def perform(report_id)
    Sidekiq::Logging.logger.info "Filter Destinations Worker #{report_id}"
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
      begin
        report = ScheduleSet.find_by(id: report_id)
        Sidekiq::Logging.logger.info "Filter Destinations Worker Lock acquired for #{report_id}"

        if report
          Sidekiq::Logging.logger.info "Filter Destinations Worker processing #{report_id}: #{report.report_key_code}"
          if report.load_status and report.load_status['destinations_map_status'] == 'refreshed'
            processor = Oag::Process.new
            processor.logger = Sidekiq::Logging.logger

            Sidekiq::Logging.logger.info "Filter Destinations Worker filtering destinations   #{report_id}: #{report.report_key_code}"
            report.load_status['destinations_map_status'] = 'filtering_eff_days'
            processor.filter_destinations(report)
            report.load_status['destinations_map_status'] == 'filtered_eff_days'
            report.save

          end
        end
      ensure
        lock.release!
      end
    else
      report = ScheduleSet.find_by(id: report_id)
      Sidekiq::Logging.logger.info "Filter Destinations Worker, busy, delaying #{report_id} for 08 minute #{report.report_key_code}"
      FilterDestinationsWorker.delay_for(8.minute).perform_async(report_id)
    end
    #Do Something here with the message
    #
  end
end