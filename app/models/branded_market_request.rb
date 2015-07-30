class BrandedMarketRequest < ActiveRecord::Base
  include ArelHelpers::ArelTable
  # attr_accessor :brand_key, :key, :origin, :dest, :cxrs, :host
  belongs_to :brand
  has_many :branded_market_route_request
  has_many :branded_route_requests, through: :branded_market_route_request

  scope :keyed,     lambda {|brand_key| where(brand_key: brand_key)}
  scope :branded,    lambda {|brand|    where(brand_id:  brand.id)}
  scope :market,    lambda {|o,d|       where(:origin =>  o, :dest => d)}


  def shrink_ray brr_list
    shrunk_list = brr_list
    brr_list.each_cons(2) do |brr, next_brr|
      through_request = brr.through_route_request next_brr
      unless through_request.blank?
        current_i  = brr_list.index(brr)
        prev_i     = current_i - 1
        last_index = brr_list.count - 1
        save_list = []
        unless current_i == 0
          save_list = brr_list[0..prev_i]
        else
          prev_i = 0
        end
        new_list = [through_request] + brr_list[current_i+2..last_index]
        shrunk_list = save_list + shrink_ray(new_list)
        break
      end
    end
    return shrunk_list
  end

  def through_market_request

      brr_list = branded_route_requests.to_a
      brr_list = shrink_ray(brr_list)

      if brr_list.count != branded_route_requests.count
        bmr = BrandedMarketRequest.joins(:branded_route_requests)
                            .where(BrandedRouteRequest[:id].in brr_list.map{|brr| [brr.id]})
                            .where(brand_key: brand_key, brand_id: brand_id,
                                   origin: origin, dest: dest).first_or_create!

        bmr.branded_route_requests << brr_list if  bmr.branded_route_requests.blank?
        return bmr

      else
        return nil
      end

  end

end

# Rails IRB Testable Code

#
#
# def shrink_ray brr_list
#    shrunk_list = brr_list
#    brr_list.each_cons(2) do |brr, next_brr|
#     puts "#{brr}, #{next_brr} = #{brr + next_brr}"
#     if ((brr + next_brr) % 15 == 0) or
#         ((brr + next_brr) % 115 == 0)
#
#         through_request = 91
#     else
#         through_request = nil
#     end
#
#
#      unless through_request.nil?
#        current_i  = brr_list.index(brr)
#        prev_i     = current_i - 1
#        last_index = brr_list.count - 1
#        save_list = []
#        unless current_i == 0
#          save_list = brr_list[0..prev_i]
#        end
#        new_list = [through_request] + brr_list[current_i+2..last_index]
#        shrunk_list = save_list + shrink_ray(new_list)
#        break
#      end
#    end
#    return shrunk_list
#  end
#
#
# shrink_ray [*0..30]
