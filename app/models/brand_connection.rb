class BrandConnection < ActiveRecord::Base
  belongs_to :brand
  belongs_to :sched1, :class_name => 'OagSchedule'
  belongs_to :sched2, :class_name => 'OagSchedule'


  scope :keyed,     lambda {|brand_key| where(brand_key: brand_key)}
  scope :branded,    lambda {|brand|    where(brand_id:  brand.id)}
  scope :market,    lambda {|o,d|       where(:origin =>  o, :dest => d)}

  scope :arriving,        lambda {|dest|   where(:dest => dest)            }
  scope :departing,       lambda {|origin| where(:origin =>  origin)       }

  # class method


  # instance methods
  def connects_with
    BrandConnection.where(sched1_id: sched2_id)
  end

  def market
    origin + dest
  end

  def eff_window_key
     "#{eff.to_date} - #{disc.to_date} #{operating_window.join(',')}"
  end
  def path_key
    "#{origin}-#{via}-#{dest}"
  end
   def key
     "#{path_key}-#{sched1_cxr},#{sched2_cxr}"
   end
   def full_key
     [key, eff_window_key].join('...')
   end

   def to_pricing_requests

     rr1 = BrandedRouteRequest.where( brand_id: brand_id, brand_key: brand_key, origin: origin,  dest: via, cxrs: [sched1_cxr], host: brand.host_map[sched1_cxr]).first_or_create!
     rr2 = BrandedRouteRequest.where( brand_id: brand_id, brand_key: brand_key, origin: via,  dest: dest, cxrs: [sched2_cxr], host: brand.host_map[sched2_cxr]).first_or_create!

     pr1 = BrandedPriceRequest.where(eff: eff, disc: disc,operating_window: operating_window, branded_route_request_id: rr1.id).first_or_create!
     pr2 = BrandedPriceRequest.where(eff: eff, disc: disc,operating_window: operating_window, branded_route_request_id: rr2.id).first_or_create!

     [pr1,pr2]


   end

  def to_market_request
     rr1 = BrandedRouteRequest.where( brand_id: brand_id,brand_key: brand_key, origin: origin,  dest: via, cxrs: [sched1_cxr], host: brand.host_map[sched1_cxr]).first_or_create!
     rr2 = BrandedRouteRequest.where( brand_id: brand_id,brand_key: brand_key, origin: via,  dest: dest, cxrs: [sched2_cxr], host: brand.host_map[sched2_cxr]).first_or_create!
     mkt_r = BrandedMarketRequest.joins(:branded_route_requests).where(BrandedRouteRequest[:id].in [rr1.id, rr2.id]).where(brand_key: brand_key, brand_id: brand_id, origin: origin, dest: dest).first_or_create!
     mkt_r.branded_route_requests << [rr1,rr2] if  mkt_r.branded_route_requests.blank?
     # mkt_r = BrandedMarketRequest.branded(brand).market(origin, dest).joins(:branded_route_requests).where(BrandedRouteRequest[:id].in [rr1.id, rr2.id].sort)
     # mkt_r = BrandedMarketRequest.branded(brand).market(origin, dest).where(branded_route_request_ids: [rr1.id, rr2.id].sort)
     # unless mkt_r
     #   mkt_r = BrandedMarketRequest.create(brand_id: brand_id, brand_key: brand_key, origin: origin, dest: dest)
     #   mkt_r.branded_route_requests << rr1
     #   mkt_r.branded_route_requests << rr2
     #   mkt_r.save
     # end
     mkt_r


   end

  def to_route_requests

    rr1 = BrandedRouteRequest.where( brand_id: brand_id,brand_key: brand_key, origin: origin,  dest: via, cxrs: [sched1_cxr], host: brand.host_map[sched1_cxr]).first_or_create!
    rr2 = BrandedRouteRequest.where( brand_id: brand_id,brand_key: brand_key, origin: via,  dest: dest, cxrs: [sched2_cxr],   host: brand.host_map[sched2_cxr]).first_or_create!

    [rr1,rr2]


  end


end