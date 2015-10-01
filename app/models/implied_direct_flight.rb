class ImpliedDirectFlight < ActiveRecord::Base
  belongs_to :brand
  belongs_to :implied_market_references
end
