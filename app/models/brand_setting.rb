class BrandSetting < ActiveRecord::Base
  belongs_to :brand
  validates_presence_of :default_currency
  validates_presence_of :max_segments

end
