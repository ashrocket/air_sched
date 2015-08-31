class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :code, use: [:slugged, :finders]

  has_many :brand_report_keys, dependent: :destroy
  has_many :report_keys,  -> { order(report_key: :asc) }, through: :brand_report_keys

  has_many :hosts, -> { order(name: :asc) }

  scope :keyed,     lambda {|brand_key| find_by(brand_key: brand_key)}

  # Class Methods
  class << self


  end

  #
  # Instance Methods
  #
  def hosts_for(cxrs)
    hosts.includes(:airlines).where(Airline[:code].in(cxrs)).references(:airlines)
  end


  def report_key_strings
    if  report_keys and report_keys.count > 1 and report_keys.first.is_a?(ReportKey)
        report_keys.map{|r| r.report_key}
    else
      [""]
    end

  end

  def build_connections
    oag_reports = report_keys.map{ |rk| OagReport.keyed(rk.report_key).latest}


  end

end