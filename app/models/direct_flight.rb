class DirectFlight < ActiveRecord::Base
  include ArelHelpers::ArelTable

  belongs_to :report_key
  # :cxx
  # :hub
  # :origin
  # :dest
  # :carriers
  scope :keyed, lambda {|report_keys| where(report_key: [report_keys].flatten)}
  scope :branded,     lambda {|brand| where(report_key: brand.report_keys) }

  class << self
    #
    # Scopes
    #
    #def cxx cxr
    #   where("cxx = ?",  cxr)
    #end
    #def hub apt
    #  where("hub = ?",  apt)
    #end


    def pair o,d
      where(origin: o, dest: d)
    end

    # -----
    # Cached Data
    # ----
    def cached_origins report_key
       Rails.cache.fetch("direct_flight_origin_#{report_key.code.parameterize.downcase}", :expires_in => 1.hour) do
         codes = keyed(report_key).select("DISTINCT(origin)").map{|f| f.origin}
         Airport.where(code:codes)
       end
    end
    def origins
      cached_origins ReportKey.current_key
    end


    def cached_dest_airports  report_key, origin_code
       Rails.cache.fetch("direct_flights_dest_#{report_key.code.parameterize.downcase}_#{origin_code}", :expires_in => 1.hour) do
         codes = keyed(report_key).where(origin: origin_code).select("DISTINCT(dest)").map{|f| f.dest}
         Airport.where(code:codes)
       end
     end
    def dest_airports origin_code
      cached_dest_airports ReportKey.current_key, origin_code
    end

    def cached_pair report_key, o,d
        Rails.cache.fetch("direct_flight_#{report_key.code.parameterize.downcase}_#{o}_#{d}", :expires_in => 1.hour) do
          keyed(report_key).pair(o,d)
        end
    end

    #
    # Helper and Import Methods
    #
    def load cxr
        where(cxx: cxr, hub: nil).delete_all
        #cxr_origins = OagSchedule.hub(hub).where(dest_apt: hub).pluck(:origin_apt, :airline_code, :mkt_cxrs ).uniq
        #cxr_dests = OagSchedule.hub(hub).where(origin_apt: hub).pluck(:dest_apt,:airline_code).uniq

        #origins = OagSchedule.cxr(cxr).distinct()
        direct_flight_records = []

        #origins = OagSchedule.cxr(cxr).pluck(:origin_apt, :airline_code, :mkt_cxrs).uniq

        schedules     = OagSchedule.cxr(cxr).select(:origin_apt, :dest_apt, :airline_code, :mkt_cxrs).distinct
        cxr_schedules = schedules.group_by{|flt| [flt.origin_apt, flt.dest_apt] }.map{ |apt_pair,sched_a|
                                       [apt_pair, (sched_a.map{|sched| sched.airline_code } +
                                             sched_a.map{|sched| sched.mkt_carriers}.flatten(1)).uniq]}
        cxr_schedules.sort!
        cxr_schedules.each do |combo|
          direct_flight_records << new(cxx: cxr, origin: combo[0][0], dest: combo[0][1], carriers: combo[1])
        end
        ##origins = OagSchedule.for_cxr(cxr).pluck(:origin_apt).uniq
        #origins.each do |o_apt|
        #  dest_apts = OagSchedule.cxr(cxr).where(origin_apt: o_apt).pluck(:dest_apt, :airline_code).uniq
        #  dest_apts.each do |dest_apt|
        #    direct_flight_records << new(cxx: cxr, origin: o_apt, dest: dest_apt)
        #  end
        #end
        DirectFlight.import direct_flight_records
    end

    def load_by_hub hub
        where(hub: hub).delete_all
        direct_flight_records = []
        cxr_origins = OagSchedule.hub(hub).where(dest_apt: hub).pluck(:origin_apt, :airline_code ).uniq
        cxr_dests = OagSchedule.hub(hub).where(origin_apt: hub).pluck(:dest_apt,:airline_code).uniq
        # Crude Pivot Table
        cxr_origins = cxr_origins.group_by{|flt| flt[0]}.map{ |apt,v_a|  [apt, v_a.map{|v| v[1]}.join(',')] }
        cxr_dests = cxr_dests.group_by{|flt| flt[0]}.map{   |apt,v_a|  [apt, v_a.map{|v| v[1]}.join(',')] }
        cxr_origins.sort!
        cxr_dests.sort!
        cxr_origins.each do |combo|
          direct_flight_records << new(hub: hub, origin: combo[0], dest: hub, carriers: combo[1])
        end
        cxr_dests.each do |combo|
          direct_flight_records << new(hub: hub, origin: hub, dest: combo[0], carriers: combo[1])
        end
        DirectFlight.import direct_flight_records
    end



  end #   class << self

end