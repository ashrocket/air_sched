class Host < ActiveRecord::Base
  belongs_to :brand
  has_many :airlines_hosts
  has_many :airlines, through: :airlines_hosts

end
