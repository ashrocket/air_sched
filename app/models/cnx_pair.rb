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

  scope :from_airport,       lambda {|origin| where("origin = ?",  origin)}
  #scope :cxx,  lambda {|cxx| where("cxr = ?",  cxx)}
  #scope :hub,       lambda {|hub| where("hub = ?",  hub)}
  scope :keyed, lambda {|report_keys| where(report_key: [report_keys].flatten)}

  # -----------------
  # Class methods
  # -------------
  class << self

    #def load(cxr)
    #      pairs = []
    #      connections = []
    #      self.where(cxr:cxr).delete_all
    #
    #      pairs =  Destination.cxx(cxr).pluck(:origin_code, :dest_code).uniq
    #      tot = pairs.count
    #      pairs.in_groups_of(1000) do |pair_group|
    #        puts "Building #{pair_group.count} connection pairs out of #{tot} remaining"
    #        tot -= 1000
    #        pair_group.compact.each do |pair|
    #           o_name =  Airport.cached_name(pair[0])
    #           d_name = Airport.cached_name(pair[1])
    #           connections << self.new(origin: pair[0], origin_name: o_name, dest: pair[1], dest_name: d_name, cxr: cxr)
    #        end
    #        CnxPair.import connections
    #        connections = []
    #      end
    #end
    #def load_by_hub(hub)
    #      pairs = []
    #      connections = []
    #      self.where(hub:hub).delete_all
    #
    #      pairs =  Destination.hub(hub).pluck(:origin_code, :dest_code).uniq
    #      tot = pairs.count
    #      pairs.in_groups_of(1000) do |pair_group|
    #        puts "Building #{pair_group.count} connection pairs out of #{tot} remaining"
    #        tot -= 1000
    #        pair_group.compact.each do |pair|
    #           o_name =  Airport.cached_name(pair[0])
    #           d_name = Airport.cached_name(pair[1])
    #           connections << self.new(hub: hub, origin: pair[0], origin_name: o_name, dest: pair[1], dest_name: d_name)
    #        end
    #        CnxPair.import connections
    #        connections = []
    #      end
    #end
  end # class << self

  def disp_origin
      "#{origin_name} (#{origin})"
   end
   def disp_dest
     "#{dest_name} (#{dest})"

   end

end
