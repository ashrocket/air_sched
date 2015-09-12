class BrandedMarketRouteRequest < ActiveRecord::Base
  # attr_accessor :brand_id, , :origin, :dest, :cxrs, :host

  belongs_to :branded_market_request
  belongs_to :branded_route_request
  acts_as_list :scope => :branded_market_request



end