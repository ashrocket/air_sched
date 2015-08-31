class ExportSmartRouteReport < ActiveRecord::Base
  belongs_to :brand

  after_create :build_steps
  validates :brand_id, presence: true

  scope :branded,      lambda {|brand|    where(brand_id:  brand.id)}



  def build_steps
    self.status =  'unitialized' unless self.status
    details['progress'] = 'branded_connections:waiting'

    report_key_updates = {}
    in_progress_report_keys = []

    oag_reports = brand.report_keys.map{ |rk| OagReport.keyed(rk.report_key).latest}
    oag_reports.each do |report|
      if report and report.complete
        updated_status = {updated: report.updated_at,
                         load_status: report.load_status["destinations_map_status"]}

        report_key_updates[report.report_key] = updated_status
      elsif report and !report.complete
        in_progress_report_keys << {report_key: report.report_key, status: report.status}
      end
    end
    details['report_key_updates'] = report_key_updates
    details['in_progress_report_keys'] = in_progress_report_keys
    self.save


  end

  def build_branded_connections

  end

  def build_branded_connections

  end

  def build_branded_connections

  end

end
