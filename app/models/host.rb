class Host < ActiveRecord::Base
  include ArelHelpers::ArelTable


  belongs_to :brand
  has_many :airlines_hosts, dependent: :destroy
  has_many :airlines, through: :airlines_hosts

  scope :branded,    lambda {|brand|    where(brand_id:  brand.id)}
  scope :branded_or_unassigned,    lambda {|brand|    where(brand_id:  [brand.id,nil])}


  def carrier_codes
    airlines.map{|a| a.code}
  end

end
