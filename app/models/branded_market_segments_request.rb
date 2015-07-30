class BrandedMarketSegmentsRequest < ActiveRecord::Base
  include ArelHelpers::ArelTable

  # attr_accessor :brand_key, :key, :origin, :dest, :cxrs, :host
  belongs_to :brand

  scope :keyed,     lambda {|brand_key| where(brand_key: brand_key)}
  scope :branded,    lambda {|brand|    where(brand_id:  brand.id)}
  scope :market,    lambda {|o,d|       where(:origin =>  o, :dest => d)}


  def branded_market_requests
    BrandedMarketRequest.where(id: branded_market_request_ids)
  end
end