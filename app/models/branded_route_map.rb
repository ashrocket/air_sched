class BrandedRouteMap < ActiveRecord::Base

  scope :keyed,     lambda {|brand_key| where(brand_key:  brand_key)}
  scope :branded,    lambda {|brand|    find_by(brand_id:  brand.id)}

end