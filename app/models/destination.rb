class Destination < ActiveRecord::Base
  # :hub
  # :cxx

  # :origin
  # :origin_code
  # :cxr1
  # :hub_name
  # :hub_code
  # :cxr2
  # :dest
  # :dest_code
  scope :keyed,  lambda {|report_key| where("report_key = ?",  report_key)}
  #scope :cxx,  lambda {|cxx| where("cxx = ?",  cxx)}
  #scope :hub,       lambda {|hub| where("hub = ?",  hub)}
  class << self
    #
    # Scopes
    #

  def cxx_hubs cxx, o, d
    res = where(cxx: cxx, origin_code:  o, dest_code: d)
    res.map!(&:hub_code).to_a
  end
  def hubs data_key, o, d
    res = keyed(data_key).where(:origin_code =>  o, :dest_code => d)
    res.map!(&:hub_code).to_a
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
    (cached_origins ABBConfig.data_key)
  end
  def cached_dest_airports  data_key, origin_code
     Rails.cache.fetch("destination_dest_#{mode}_#{mode_key}_#{origin_code}", :expires_in => 1.hour) do
       codes = keyed(data_key).where(origin_code: origin_code).select("DISTINCT(dest_code)").map{|f| f.dest_code}
       Airport.where(code:codes)
     end
   end
  def dest_airports origin_code
    (cached_dest_airports ABBConfig.data_key, origin_code)
  end

  # -----
  # Data base loader
  # ----
  #def load cxr
  #    where(cxx: cxr).delete_all
  #    direct_flights = DirectFlight.cxx(cxr).to_a
  #    cnx = []
  #    connections = []
  #    # Let's cache the results to limit DB Hits.
  #    cache = {}
  #
  #    origins      = DirectFlight.cxx(cxr).pluck(:origin).uniq
  #    direct_pairs = DirectFlight.cxx(cxr).pluck(:origin, :dest)
  #    direct_pairs.sort!
  #    direct_pairs_hash = direct_pairs.group_by{|pair| pair[0]}
  #    origins.each do |o_apt|
  #      if cache.has_key? o_apt
  #        hub_apts = cache[o_apt].dup
  #      else
  #        hub_apts = direct_flights.select{|r| r.origin.eql? o_apt}.map{|r| r.dest}.uniq
  #        cache[o_apt] =  hub_apts.dup
  #      end
  #
  #
  #      hub_apts.each do |hub|
  #        if cache.has_key? hub
  #          dest_apts = cache[hub].dup
  #        else
  #          dest_apts = direct_flights.select{|r| r.origin.eql? hub}.map{|r| r.dest}.uniq
  #
  #          cache[hub] =  dest_apts.dup
  #        end
  #
  #        dest_apts.delete_if{|apt| apt.eql? o_apt}
  #        dest_apts.each do |dest|
  #          cnx << [o_apt,hub,dest] unless o_apt.eql? dest
  #        end
  #      end
  #    end
  #    Rails.logger.info "Unique Connection Pairs not filtered for Direct Flight Exclusion rule #{cnx.count}"
  #    cnx.delete_if{|row| direct_pairs_hash[row[0]].include? [row[0],row[2]] }
  #    Rails.logger.info "Unique Connection Pairs after filtered for Direct Flight Exclusion rule #{cnx.count}"
  #    tot = cnx.count
  #    cnx.in_groups_of(1000) do |cnx_group|
  #      puts "Building #{cnx_group.count} connections out of #{tot} remaining"
  #      tot -= 1000
  #      cnx_group.compact.each do |row|
  #       o_name = Airport.cached_name(row[0])
  #       h_name = Airport.cached_name(row[1])
  #       d_name = Airport.cached_name(row[2])
  #       connections << self.new(cxx: cxr, origin: o_name, origin_code: row[0], hub_name: h_name, hub_code: row[1], dest: d_name,dest_code: row[2], cxrs1: [cxr].join(","), cxrs2: [cxr].join(","))
  #      end
  #      Destination.import connections
  #      connections = []
  #    end
  #
  #end
  def load_by_hub hub
    where(hub: hub).delete_all
      direct_flights = DirectFlight.hub(hub).to_a
      cnx = []
      connections = []
      # Let's cache the results to limit DB Hits.
      cache = {}

      origins      = DirectFlight.hub(hub).where.not(origin: hub).pluck(:origin, :carriers).uniq
      dest_apts    = DirectFlight.hub(hub).where.not(dest: hub).pluck(:dest, :carriers).uniq
      #origins.delete_if{|a| a[0].eql? hub }
      #dest_apts.delete_if{|a| a[0].eql? hub }

      origins.each do |o_apt|
         next if o_apt.eql?(hub)
         dest_apts.each do |dest|
            next if dest.eql?(o_apt) or dest.eql?(hub)
            cnx << [o_apt[0], dest[0], hub, o_apt[1],dest[1] ]
          end
      end

      cnx.each do |row|
         o_name = Airport.cached_name(row[0])
         d_name = Airport.cached_name(row[1])
         h_name = Airport.cached_name(row[2])
         cxrs1  = row[3]
         cxrs2  = row[4]
         # This cxr1 field should be an array
         #connections << self.new(hub: hub, origin: o_name, origin_code: row[0], hub_name: h_name, hub_code: row[1], dest: d_name,dest_code: row[2], cxr1: cxr, cxr2: cxr)
         connections << self.new(hub: hub, origin: o_name, origin_code: row[0], dest: d_name,dest_code: row[1],
                                 hub_name: h_name, hub_code: row[2],
                                 cxrs1: cxrs1, cxrs2: cxrs2 )


      end

      Destination.import connections
  end
  end # class << self


  def disp_origin
     "#{self.origin} (#{self.origin_code})"
  end
  def disp_dest
    "#{self.dest} (#{self.dest_code})"

  end
end
