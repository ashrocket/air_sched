class Host < ActiveRecord::Base
  include ArelHelpers::ArelTable


  belongs_to :brand
  has_many :airlines_hosts, dependent: :destroy
  has_many :airlines, through: :airlines_hosts

  # Class Methods
  class << self
    def by_carriers(cxrs)
      includes(:airlines).where(Airline[:code]).in(cxrs)
    end

  end

end
