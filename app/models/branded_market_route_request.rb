class BrandedMarketRouteRequest < ActiveRecord::Base
  # attr_accessor :brand_key, :key, :origin, :dest, :cxrs, :host
  belongs_to :branded_route_request
  belongs_to :branded_market_request



end