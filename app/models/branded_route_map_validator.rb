class BrandedRouteMapValidator < ActiveRecord::Base
  belongs_to :brand

  scope :branded,    lambda {|brand|  find_by(brand: brand)}

end