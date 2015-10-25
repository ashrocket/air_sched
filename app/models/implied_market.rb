class ImpliedMarket < ActiveRecord::Base
  belongs_to :brand
  has_one :branded_route_map_validator, dependent: :destroy

  # ransacker :one_seg_count do
  #     Arel.sql("(select route_map_counts->>'1' from branded_route_map_validators   WHERE implied_market_id = #{self.id})")
  # end
end
