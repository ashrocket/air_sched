class CnxPair < ActiveRecord::Base
  # :id
  # :cxr
  # :hub
  # :origin
  # :origin_name
  # :dest
  # :dest_name
  # :cxr
  belongs_to :report_key
  belongs_to :origin_airport, class_name: 'Airport'
  belongs_to :dest_airport, class_name: 'Airport'

  scope :from_airport,       lambda {|origin| where(origin:  origin)}
  scope :keyed, lambda {|report_keys| where(report_key: report_keys)}

  # -----------------
  # Class methods
  # -------------
  class << self


  end # class << self

  def disp_origin
      "#{origin_name} (#{origin})"
   end
   def disp_dest
     "#{dest_name} (#{dest})"

   end

end
