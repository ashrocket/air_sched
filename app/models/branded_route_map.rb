class BrandedRouteMap < ActiveRecord::Base
  belongs_to :brand

  scope :branded,    lambda {|brand|  find_by(brand_id: brand.id)}

end