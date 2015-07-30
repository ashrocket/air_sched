class BrandedPriceRequest < ActiveRecord::Base
  extend Forwardable

  belongs_to :branded_route_request
  def_delegators :branded_route_request, :key, :brand_key, :origin, :dest, :cxrs, :host

  attr_accessor  :eff, :disc, :operating_window

  after_initialize do |rr|
     cxrs = cxrs.sort.uniq
     pricing_key = [branded_route_request.key, eff_window_key].join('-')
  end

  # def initialize(attributes = {})
  #   byebug
  #   unless attributes[branded_route_request_id]
  #   branded_route_request = BrandedRouteRequest.where(attributes.except(:eff, :disc, :operating_window))
  #       .first_or_create!
  #   else
  #     branded_route_request_id =  attributes[branded_route_request_id]
  #   end     # prepare delegate object
  #   eff = attributes[:eff]
  #   disc = attributes[:disc]
  #   operating_window = attributes[:operating_window]
  #   pricing_key = [branded_route_request.key, eff_window_key].join('-')
  #
  #
  # end

  def route_request
    branded_route_request
  end

  def through_pricing_request other
    if( [host,cxrs, eff, disc, operating_window] ==
        [other.host, other.cxrs, other.eff, other.disc, other.operating_window]
      )
      pr2 = self.clone
      pr2.dest = other.dest
      pr2.cxrs = (pr2.cxrs + other.cxrs).sort.uniq
      pr2
    else
      nil
    end

  end

  def eff_window_key
    "#{@eff} - #{@disc} #{@operating_window.join(',')}"
  end



end