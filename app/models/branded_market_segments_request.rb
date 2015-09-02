class BrandedMarketSegmentsRequest < ActiveRecord::Base
  include ArelHelpers::ArelTable

  # attr_accessor :brand_key, :key, :origin, :dest, :cxrs, :host
  belongs_to :brand

  scope :branded,      lambda {|brand|    where(brand:  brand)}
  scope :market,       lambda {|o,d|       where(:origin =>  o, :dest => d)}
  scope :with_segs,    lambda {|seg_count|       where(:segment_count => seg_count) }


  def branded_market_requests
    BrandedMarketRequest.where(id: branded_market_request_ids)
  end
end