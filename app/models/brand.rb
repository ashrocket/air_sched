class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :brand_key, use: :slugged

  has_many :brand_report_keys
  has_many :report_keys,  -> { order(report_key: :asc) }, through: :brand_report_keys

  has_many :hosts

  scope :keyed,     lambda {|brand_key| where(brand_key: brand_key)}

end