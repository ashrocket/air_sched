class BrandedMarketRouteMap < ActiveRecord::Base
  belongs_to :brand

  validates_uniqueness_of :brand_id, scope: [:origin, :dest]

end