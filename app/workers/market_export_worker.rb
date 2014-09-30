require 'oag/market_data_exporter'
require 'sidekiq-lock'

class MarketExportWorker
include Sidekiq::Worker
include Sidekiq::Lock::Worker
include Sidetiq::Schedulable
sidekiq_options :queue => :export_queue, :retry => false, :backtrace => true
sidekiq_options lock: { timeout: 600000, name: 'lock-export-worker' }

recurrence { daily(1) }

def perform()
   if lock.acquire!
     begin
       @export_report = ExportReport.create(status: 'started')
       exporter = MarketDataExporter.new({})
       url = exporter.export_to_s3
       @export_report.status = 'exported'
       @export_report.location = url

       @export_report.save
     ensure
       lock.release!
     end
   end
end
end