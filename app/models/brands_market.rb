class BrandsMarket < ActiveRecord::Base
  belongs_to :brand
  belongs_to :market
end
