# app/workers/export_market_data_worker.rb

require 'oag/exporters/market_data_exporter'
require 'sidekiq-lock'

class ExportMarketDataWorker
include Sidekiq::Worker
include Sidekiq::Lock::Worker
sidekiq_options :queue => :export_queue, :retry => false, :backtrace => true
sidekiq_options lock: { timeout: 600000, name: 'lock-export-market-worker' }


def perform()
   Rails.logger = Sidekiq::Logging.logger
   if lock.acquire!
     begin
       @export_report = ExportMarketDataReport.create(status: 'started')
       exporter = Oag::MarketDataExporter.new
       url = exporter.export_to_s3
       @export_report.status = 'exported'
       @export_report.location = url.to_s

       @export_report.save
     ensure
       lock.release!
     end
   end
end
end
Sidekiq::Cron::Job.create(name: 'ExportMarketDataWorker daily', cron: '* * */1 * *', klass: 'ExportMarketDataWorker')
