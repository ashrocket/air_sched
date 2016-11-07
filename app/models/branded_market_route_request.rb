class BrandedMarketRouteRequest < ActiveRecord::Base
  # attr_accessor :brand_id, , :origin, :dest, :cxrs, :host

  belongs_to :brand
  belongs_to :branded_market_request
  belongs_to :branded_route_request


  # validates :brand, :branded_market_request, :branded_route_request, presence: true
  # validates_uniqueness_of :branded_market_request_id, scope: [:brand_id, :branded_route_request_id]

  # acts_as_list :scope => :branded_market_request



end