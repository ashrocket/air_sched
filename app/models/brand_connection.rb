class BrandConnection < ActiveRecord::Base

  belongs_to :brand
  belongs_to :sched1, :class_name => 'OagSchedule'
  belongs_to :sched2, :class_name => 'OagSchedule'


  scope :branded,    lambda {|brand|    where(brand:  brand)}
  scope :market,    lambda {|o,d|       where(:origin =>  o, :dest => d)}

  scope :arriving,        lambda {|dest|   where(:dest => dest)            }
  scope :departing,       lambda {|origin| where(:origin =>  origin)       }
  scope :via,             lambda {|via| where(:via =>  via)       }

  # class method

  def self.connecting_scheds(connection)
    where(sched1: connection.sched2).to_a
        .delete_if{|other| other.sched2_id == connection.sched1_id or other.dest == connection.origin}
  end
  # instance methods
  # connects_with (sched1_id, sched2_id, origin) Could Imporve =>
  #  where(sched1_id: my_sched1_id).to_array
  #   .delete_if{|sched| sched.sched2_id == my_sched1_id or sched.dest == my_sched1_origin}
  def connects_with
    BrandConnection.where(sched1_id: sched2_id).where.not(sched2_id: sched1_id).where.not(dest: origin)
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

   def route_cxrs_hash_key
     {o: origin, v: via, d: dest , c1: sched1_cxr, c2: sched1_cxr}
   end
   def to_pricing_requests

     pr_arr = []
     rr_arr = self.to_route_requests
     rr_arr.each do |rr1, rr2|
        pr1 = BrandedPriceRequest.where(eff: eff, disc: disc,operating_window: operating_window, branded_route_request_id: rr1.id).first_or_create!
        pr2 = BrandedPriceRequest.where(eff: eff, disc: disc,operating_window: operating_window, branded_route_request_id: rr2.id).first_or_create!
        pr_arr << [pr1,pr2]
     end
     pr_arr

   end

  # def to_market_request
  #    mr_arr = []
  #    rr_arr = self.to_route_requests
  #    rr_arr.each do |rr1, rr2|
  #      mkt_r = BrandedMarketRequest.joins(:branded_route_requests)
  #                  .where(BrandedRouteRequest[:id].in [rr1.id, rr2.id])
  #                  .where(brand: brand, origin: origin, dest: dest).first_or_create!
  #      mkt_r.branded_route_requests << [rr1,rr2] if  mkt_r.branded_route_requests.blank?
  #      mr_arr << mkt_r
  #    end
  #    # mkt_r = BrandedMarketRequest.branded(brand).market(origin, dest).joins(:branded_route_requests).where(BrandedRouteRequest[:id].in [rr1.id, rr2.id].sort)
  #    # mkt_r = BrandedMarketRequest.branded(brand).market(origin, dest).where(branded_route_request_ids: [rr1.id, rr2.id].sort)
  #    # unless mkt_r
  #    #   mkt_r = BrandedMarketRequest.create(brand_id: brand_id, brand_key: brand_key, origin: origin, dest: dest)
  #    #   mkt_r.branded_route_requests << rr1
  #    #   mkt_r.branded_route_requests << rr2
  #    #   mkt_r.save
  #    # end
  #    mr_arr
  #  end

  def to_route_requests
    rr_arr = []
    hosts_1 = brand.hosts_for(sched1_cxr).uniq
    hosts_2 = brand.hosts_for(sched2_cxr).uniq

    hosts_1.each do |host1|
      hosts_2.each do |host2|
        rr1 = BrandedRouteRequest.where(brand: brand, origin: origin,  dest: via,
                cxrs: [sched1_cxr], host: host1.code).first_or_create!
        rr2 = BrandedRouteRequest.where(brand: brand, origin: via,  dest: dest,
                cxrs: [sched2_cxr], host: host2.code).first_or_create!

        rr_arr << [rr1,rr2]
      end
    end
    rr_arr
  end


end