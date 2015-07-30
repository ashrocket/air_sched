class BrandRouteMap < ActiveRecord::Base

  scope :keyed,     lambda {|brand_key| where("brand_key = ?",  brand_key)}

end