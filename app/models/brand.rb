class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :brand_key, use: :slugged

  has_many :brand_report_keys, dependent: :destroy
  has_many :report_keys,  -> { order(report_key: :asc) }, through: :brand_report_keys

  has_many :hosts

  scope :keyed,     lambda {|brand_key| where(brand_key: brand_key)}

  # Class Methods
  class << self


  end

  #
  # Instance Methods
  #
  def hosts_for(cxrs)
      hosts.by_carriers(cxrs)
  end


  def report_key_strings
    if  report_keys and report_keys.count > 1 and report_keys.first.is_a?(ReportKey)
        report_keys.map{|r| r.report_key}
    else
      [""]
    end

  end

end