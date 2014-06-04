# app/workers/process_attachment_worker.rb
require 'oag/process'
class ScheduleImportWorker
  include Sidekiq::Worker

  def perform(report_id)
    report = OagReport.find(report_id)
    if report
      Oag::Process.import_oag_file(report)
      report.save
    end

    #Do Something here with the message
    #
  end
end