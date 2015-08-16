class Brand < ActiveRecord::Base
  extend FriendlyId
  friendly_id :brand_key, use: :slugged

  scope :keyed,     lambda {|brand_key| where(brand_key: brand_key)}

end