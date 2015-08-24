class Destination < ActiveRecord::Base
  # :report_key
  # :origin
  # :origin_code
  # :cxr1
  # :hub_name
  # :hub_code
  # :cxr2
  # :dest
  # :dest_code
  # :eff_days
  scope :keyed,  lambda {|report_key| where("report_key = ?",  report_key)}
  class << self
    #
    # Scopes
    #

  # def cxx_hubs cxx, o, d
  #   keyed(data_key).where(cxx: cxx, origin_code:  o, dest_code: d).pluck(:hub_code)
  # end
  def hubs data_key, o, d
    keyed(data_key).where(:origin_code =>  o, :dest_code => d).pluck(:hub_code)
  end
  # -----
  # Cached Data
  # ----
  def cached_origins data_key
     Rails.cache.fetch("destination_origin_#{data_key}", :expires_in => 1.hour) do
       codes = keyed(data_key).select("DISTINCT(origin_code)").map{|f| f.origin_code}
       Airport.where(code:codes)
     end
   end
  def origins
    (cached_origins ReportKey.current_key)
  end
  def cached_dest_airports  data_key, origin_code
     Rails.cache.fetch("destination_dest_#{mode}_#{mode_key}_#{origin_code}", :expires_in => 1.hour) do
       codes = keyed(data_key).where(origin_code: origin_code).select("DISTINCT(dest_code)").map{|f| f.dest_code}
       Airport.where(code:codes)
     end
   end
  def dest_airports origin_code
    (cached_dest_airports ReportKey.current_key, origin_code)
  end



  end # class << self

  def market
    "#{origin_code}#{dest_code}"
  end
  def combinations
    cxrs1.product(cxrs2).map{|combo| combo[0] + '-' + combo[1] }
  end

  def disp_origin
     "#{self.origin} (#{self.origin_code})"
  end
  def disp_dest
    "#{self.dest} (#{self.dest_code})"

  end
end
