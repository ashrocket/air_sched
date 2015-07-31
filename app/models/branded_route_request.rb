class BrandedRouteRequest < ActiveRecord::Base
  include ArelHelpers::ArelTable
  # attr_accessor :brand_key, :key, :origin, :dest, :cxrs, :host
  belongs_to :brand
  has_many :branded_market_route_request, :dependent => :destroy
  has_many :branded_market_requests, through: :branded_market_route_request

  scope :keyed,     lambda {|brand_key| where(brand_key: brand_key)}
  scope :branded,    lambda {|brand|    where(brand_id:  brand.id)}
  scope :market,    lambda {|o,d|       where(:origin =>  o, :dest => d)}

  after_initialize do |rr|
     self.cxrs =  self.cxrs.sort.uniq
     self.key  = "#{brand.brand_key}:#{host}/#{origin}-#{dest}-#{cxrs.sort.join(',')}"
   end
  # def initialize(attributes = {})
  #   byebug
  #   super(attributes)
  #
  # end



  def through_route_request other
    #disable this for now
    return nil

    if( host.eql? other.host)
      pr2 = BrandedRouteRequest.where(
          attributes.deep_symbolize_keys.except(:id, :dest, :cxrs, :key)
              .merge(dest: other.dest,
                     cxrs: (self.cxrs + other.cxrs).sort.uniq)
      ).first_or_create!
    else
      nil
    end

  end



  def host_market_key
    "#{host}/#{origin}-#{dest}"
  end




end