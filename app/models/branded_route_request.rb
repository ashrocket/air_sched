class BrandedRouteRequest < ActiveRecord::Base
  include ArelHelpers::ArelTable
  # attr_accessor :brand_key, :key, :origin, :dest, :cxrs, :host
  belongs_to :brand

  has_many :branded_market_route_requests,  :dependent => :destroy
  has_many :branded_market_requests, through: :branded_market_route_requests



  scope :branded,    lambda {|brand|    where(brand:  brand)}
  scope :market,    lambda {|o,d|       where(:origin =>  o, :dest => d)}

  validates_uniqueness_of :brand_id, scope: [:origin, :dest, :cxrs, :host]


  after_initialize do |rr|
     self.cxrs =  cxrs.sort.uniq
     self.key  = "#{brand.brand_key}:#{host}/#{origin}-#{dest}-#{cxrs.sort.join(',')}"
   end




  def through_route_request other
    #disable this for now
    return nil

    if( host.eql? other.host)
      pr2 = BrandedRouteRequest.where(
          attributes.deep_symbolize_keys.except(:id, :dest, :cxrs)
              .merge(dest: other.dest,
                     cxrs: (cxrs + other.cxrs).sort.uniq)
      ).first_or_create!
    else
      nil
    end

  end



  def host_market_key
    "#{host}/#{origin}-#{dest}"
  end




end