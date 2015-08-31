class Airport < ActiveRecord::Base
  # :code
  # :name
  extend FriendlyId
  friendly_id :code, use: [:slugged, :finders]

  scope :by_code,   lambda {|code| where(:code => code)}

  def correct_name
    self.name.sub(' 00', '')
  end

  def correct_city
    self.city.sub(' 00', '')
  end

  class << self

  def cached code
    Rails.cache.fetch("airport_#{code}", :expires_in => 4.minutes) do
      by_code(code).first
    end
  end
  def cached_name(code)
    airport =  cached(code)
    name = airport ? airport.name : 'Unknown Airport Name'
  end

  #def refresh_from_cxx cxx
  #  origins      = OagSchedule.cxr(cxx).pluck(:origin_apt, :origin_apt_name, :origin_apt_city).uniq
  #  destinations = OagSchedule.cxr(cxx).pluck(:dest_apt, :dest_apt_name, :dest_apt_city).uniq
  #  airports = (origins + destinations).uniq!
  #  airports.each do |airport|
  #     apt = self.where(code: airport[0]).first_or_create!
  #     apt.name = airport[1]
  #     apt.city = airport[2]
  #     apt.save
  #   end
  #end
  #def refresh_from_hub hub
  #  origins      = OagSchedule.hub(hub).pluck(:origin_apt, :origin_apt_name, :origin_apt_city).uniq
  #  destinations = OagSchedule.hub(hub).pluck(:dest_apt, :dest_apt_name, :dest_apt_city).uniq
  #  airports = (origins + destinations).uniq!
  #  airports.each do |airport|
  #     apt = self.where(code: airport[0]).first_or_create!
  #     apt.name = airport[1]
  #     apt.city = airport[2]
  #     apt.save
  #   end
  #end




  end # End Class methods
  def disp_name
    if name.eql? city or city.blank?
      "#{name} (#{code})"
    else
      "#{city} (#{code})"
    end
  end
  private
end