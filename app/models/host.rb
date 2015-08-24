class Host < ActiveRecord::Base
  has_many :airlines_hosts
  has_many :airlines, through: :airlines_hosts

end
