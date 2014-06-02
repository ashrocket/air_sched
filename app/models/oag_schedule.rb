require 'oag'
require 'extras.rb'
# define my validator
#class ScheduleValidator < ActiveModel::Validator
#  # implement the method where the validation logic must reside
#  def validate(record)
#
#    # do my validations on the record and add errors if necessary
#    record.errors[:base] << "This is some custom error message"
#    record.errors[:flight_num] << "This is some complex validation"
#  end
#end
class OagSchedule < ActiveRecord::Base


  #before_create :convert_dates
  #before_save    :update_dates


  #attr_accessible :hub, :cxr
  #attr_accessible :eff_date, :disc_date
  #attr_accessible :airline_code, :airline_name, :flight_num
  #attr_accessible :origin_apt, :dest_apt
  #attr_accessible :duration
  #
  #attr_accessible :dep_time_local, :arr_time_local, :next_day_arrival
  #attr_accessible :dep_op_days, :arr_op_days
  #attr_accessible :stops, :mkt, :mkt_cxrs



  scope :cxr,       lambda {|cxr| where("cxr = ?",  cxr)}
  scope :hub,       lambda {|hub| where("hub = ?",  hub)}
  scope :for_cxr,   lambda {|cxr| where(:airline_code => cxr)}
  scope :effective, lambda {|theDay| where('? BETWEEN eff_date and disc_date', theDay ) }
  scope :arriving,        lambda {|dest|   where(:dest_apt => dest)            }
  scope :departing,       lambda {|origin| where(:origin_apt =>  origin)       }
  scope :market,          lambda {|o,d|    where(:origin_apt =>  o, :dest_apt => d)}


  def print
      puts [self.eff_date, self.disc_date, self.airline_code, self.flight_num, self.origin_apt, self.dest_apt,
       self.dep_time_local, self.arr_time_local, self.dep_op_days].join " "
      #:eff_date     =>  row[:efffrom],  :disc_date 	  => row[:effto],
      #         :airline_code => row[:carrier1],  :airline_name	=> row[:carrier1name],
      #         :flight_num   => row[:flightno1],
      #         :shared_airline_code => row[:shairldes], :shared_airline_name => row[:shrairlinedesname],
      #         :origin_apt => row[:depairport], :dest_apt => row[:arrairport],
      #         :origin_apt_name => row[:depairportname],
      #         :origin_apt_city => row[:depcityname],
      #         :dest_apt_name => row[:arrairportname],
      #         :dest_apt_city => row[:arrcityname],
      #         :dep_time_local   => row[:localdeptime], :arr_time_local   => row[:localarrtime],
      #         :next_day_arrival => row[:localarrday],
      #         :dep_op_days => row[:localdaysofop], :arr_op_days => row[:arrdaysofop],
      #         :duration    => row[:elapsedtime],
      #         :stops => row[:stops],  :restrictions => row[:restrictions],
      #         :mkt => row[:routing], :mkt_cxrs => mkt_cxrs(row),
      #         :via_apts => row[:intairports]
  end

  class << self

  def later_than(dep_time)
     where("CAST(arr_time_local as UNSIGNED) >= ?", dep_time)
  end

  def stops(num)
    where(:stops => num)
  end

  def operating(dep_date)
    where("dep_op_days REGEXP '.*?.*'", dep_date.cwday)
  end



##############################
#
# Class Methods
#
# OAG_Schedule.load_schedule array_of_rows, {:operating_cxrs=>['9W','EY']}
#
#################
#  def schedule_time_minutes(time_string)
#    (time_string[2,2].to_i.minutes + time_string[0,2].to_i.hours) / 60
#  end

  def load_hub_schedule hub, csvdata, options={}

    schedules = self.load_schedule(csvdata, options={})
    #Compute Hub Airport
    orig_airports = schedules.collect{ |n| n[:origin_apt] }
    hub1 = orig_airports.group_by { |n| n }.values.max_by(&:size).first
    dest_airports = schedules.collect{ |n| n[:dest_apt] }
    hub2 = dest_airports.group_by { |n| n }.values.max_by(&:size).first
    raise(RuntimeError, "HUB Indeterminate") if  hub1 != hub2
    hub = hub1
    self.where(:hub => hub).delete_all
    puts "Loading #{schedules.count} schedules into Schedule tables for #{hub} airport."
    expired = schedules.select{|sched| Date.parse(sched[:disc_date]) < Date.today}
    puts "There are  #{expired.count} expired schedules in the file  for #{hub} airport."
    schedules.delete_if{|sched| Date.parse(sched[:disc_date]) < Date.today}

    schedule_records = []
    loaded = 0
    schedules.in_groups_of(500) do |schedule_group|
      schedule_group.compact.each do |sched|
        begin
          schedule_records << self.new(sched.merge(:hub => hub))
        rescue Exception => e
            puts sched
            Rails.logger.error sched
            Rails.logger.error e.message
            raise RuntimeError e
        end
      end
      puts "Loading  #{schedule_records.count} valid schedules into the DB  for #{hub} airport."
      loaded += schedule_records.count
      OagSchedule.import schedule_records
      schedule_records = []
    end
    puts "--- Loaded  #{loaded} valid schedules into the DB for #{hub} airport. ---"



  end

  def load_large_cxx_schedule cxx, csvdata, options={}
    schedules = []
    csvdata.each do |csv_data_set|
      schedules << self.load_schedule(csv_data_set, options={})
    end
    schedules.flatten!
    csvdata = nil
    self.where(:cxr => cxx).delete_all
    puts "Loading #{schedules.count} schedules into Schedule tables for #{cxx} carrier."
    expired = schedules.select{|sched| Date.parse(sched[:disc_date]) < Date.today}
    puts "There are  #{expired.count} expired schedules in the file  for #{cxx} carrier."
    schedules.delete_if{|sched| Date.parse(sched[:disc_date]) < Date.today}

    loaded = 0

    schedule_records = []
    schedules.in_groups_of(500) do |schedule_group|
     schedule_group.compact.each do |sched|
           begin
             schedule_records << self.new(sched.merge(:cxr => cxx))
           rescue Exception => e
               puts sched
               puts e
               Rails.logger.error sched
               Rails.logger.error e.message
               raise e
           end

     end
     puts "Loading  #{schedule_records.count} valid schedules into the DB  for #{cxx} carrier."
     loaded += schedule_records.count

     OagSchedule.import schedule_records
     schedule_records = []
    end
    puts "--- Loaded  #{loaded} valid schedules into the DB for #{cxx} carrier. ---"
  end

  def load_cxx_schedule cxx, csvdata, options={}

    schedules = self.load_schedule(csvdata, options={})
    self.where(:cxr => cxx).delete_all
    puts "Loading #{schedules.count} schedules into Schedule tables for #{cxx} carrier."
    expired = schedules.select{|sched| Date.parse(sched[:disc_date]) < Date.today}
    puts "There are  #{expired.count} expired schedules in the file  for #{cxx} carrier."
    schedules.delete_if{|sched| Date.parse(sched[:disc_date]) < Date.today}

    loaded = 0

    schedule_records = []
    schedules.in_groups_of(500) do |schedule_group|
      schedule_group.compact.each do |sched|
            begin
              schedule_records << self.new(sched.merge(:cxr => cxx))
            rescue Exception => e
                puts sched
                puts e
                Rails.logger.error sched
                Rails.logger.error e.message
                raise e
            end

      end
      puts "Loading  #{schedule_records.count} valid schedules into the DB  for #{cxx} carrier."
      loaded += schedule_records.count

      OagSchedule.import schedule_records
      schedule_records = []
    end
    puts "--- Loaded  #{loaded} valid schedules into the DB for #{cxx} carrier. ---"

  end
  def mkt_cxrs row
    mkt_cxrs = [row[:dupcar1], row[:dupcar2], row[:dupcar3], row[:dupcar4],
                row[:dupcar5], row[:dupcar6], row[:dupcar7], row[:dupcar8]].compact
    mkt_cxrs.delete_if{|v| v.eql?"0"}
    mkt_cxrs.join ';'
  end
  def load_schedule csvdata, options={}
    schedules = []

    csvdata.each do |row|



       #case row[:dupmarker]
       #when /D|P/
       #end

       sched =
       {
           :eff_date     =>  row[:efffrom],  :disc_date 	  => row[:effto],
           :airline_code => row[:carrier1],  :airline_name	=> row[:carrier1name],
           :flight_num   => row[:flightno1],
           :shared_airline_code => row[:shairldes], :shared_airline_name => row[:shrairlinedesname],
           :origin_apt => row[:depairport], :dest_apt => row[:arrairport],
           :origin_apt_name => row[:depairportname],
           :origin_apt_city => row[:depcityname],
           :dest_apt_name => row[:arrairportname],
           :dest_apt_city => row[:arrcityname],
           :dep_time_local   => row[:localdeptime], :arr_time_local   => row[:localarrtime],
           :next_day_arrival => row[:localarrday],
           :dep_op_days => row[:localdaysofop], :arr_op_days => row[:arrdaysofop],
           :duration    => row[:elapsedtime],
           :stops => row[:stops],  :restrictions => row[:restrictions],
           :mkt => row[:routing], :mkt_cxrs => mkt_cxrs(row),
           :via_apts => row[:intairports]

       }
       sched[:op] = true if row[:opcar].eql? 'O'
       case row[:opcar]
       when /O/
         if not sched[:shared_airline_code].blank?
           sched[:op_cxr_code] = sched[:shared_airline_code]
           sched[:op_cxr_name] = sched[:shared_airline_name]
         else
           sched[:op_cxr_code]   = sched[:airline_code]
           sched[:op_cxr_name]   = sched[:airline_name]
           sched[:op_flight_num] = sched[:flight_num]

         end
       when /N/
         if not row[:dupcar1].blank?
           op_data = row[:dupcar1].split ' '
           sched[:op_cxr_code] = op_data[0]
           sched[:op_flight_num] = op_data[1]
           if sched[:op_cxr_code].eql? sched[:shared_airline_code]
                sched[:op_cxr_name] = sched[:shared_airline_name]
           else
                sched[:op_cxr_name] = Airline.by_code(sched[:op_cxr_code]).name
           end

         else
          sched[:op_cxr_code] = sched[:shared_airline_code]
          sched[:op_cxr_name] = sched[:shared_airline_name]
         end
       end
       schedules << sched
    end
    schedules

  end

  def build_connections(dep_date, mode_key, d, stops, maxct, earliest_arrival_time, is_next_day_arrival)
    #offset_time     = (earliest_arrival_time.seconds_until_end_of_day() + 1 )/60
    #remainder_maxct = [maxct - offset_time, 0].max
    #earliest_arrival_time
    #num_of_days     = (earliest_arrival_time.to_date.eql? dep_date) ? 2 : 1
    #num_of_days     = (remainder_maxct / 1440) + 2
    #num_of_days.times do |day_num|
    #  flt_date      = dep_date + day_num.days
    #  x_schedules   =  hub(mode_key).effective(flt_date).arriving(d).stops(stops).operating(flt_date)
    #  x_schedules   =  x_schedules.select{|s| schedule_time_minutes(s.dep_time_local) >= earliest_minutes} if 0.eql? day_num
    #  conn_flights += x_schedules.map{|s| s.to_flight flt_date}
    #end
    conn_flights    = []
    last_date = (earliest_arrival_time + maxct.minutes).to_date
    dates =*(earliest_arrival_time.to_date..last_date)
    dates.each do |arrival_date|
      x_schedules   =  hub(mode_key).effective(arrival_date).arriving(d).stops(stops).operating(arrival_date)
      x_flights     =  x_schedules.map{|s| s.to_flight arrival_date}
      conn_flights += x_flights.select{|flt| flt.dep_time >= earliest_arrival_time}
    end
    conn_flights.sort_by!{|flt| [flt.dep_date, flt.dep_time_local]}.each{|flt| puts flt.render}
    conn_flights
  end

  def hub_connections(o, d, hub, dep_date,  mct, maxct, stops, maxmaxct = 4320  )
     nxt_date      = dep_date + 1.day
     voyage  = {:errors => []}
     scheds  = hub(hub).effective(dep_date).departing(o).stops(stops).operating(dep_date)

     if scheds.blank?
           voyage[:errors] << "No Operating Schedule found between #{o} and #{hub} on #{dep_date}"
     end
     flights       = scheds.map{|s| s.to_flight dep_date}
     conn_flights  = []

     unless flights.blank?
       earliest_arr_time = Flight.earliest_arrival_time(flights)
       flights.each{ |flt| puts flt.render}
       conn_flights = build_connections(dep_date, hub, d, stops, maxmaxct, earliest_arr_time, false)
     end


     if conn_flights.blank?
        voyage[:errors] << "No Connecting Schedules found between #{hub} and #{d} on #{dep_date} to #{maxmaxct} minutes"
     end
     xmap = {}
     mct_invalid = {}

     flights.each do |flt|
       connections          =  conn_flights.map{|cnx| Connection.new(:leg_1 => flt, :leg_2 => cnx) }
       xmap[flt.id]         =  connections.select{|cnx| cnx.connect_time.between?(mct, maxct)}.map{|cnx| cnx.leg_2.id}
       mct_invalid[flt.id]  =  connections.select{|cnx| not cnx.connect_time.between?(mct, maxct)}.map{|cnx| cnx.leg_2.id}
     end
     conn_flights.sort_by!{|flt| [flt.dep_date, flt.dep_time] }
     flights.sort_by!{|flt| [flt.dep_date, flt.dep_time] }

     voyage.merge!(f: flights, x:  conn_flights, xmap:  xmap, mct_invalid: mct_invalid)

     voyage
  end

  def cxx_connections(o, d, hub, dep_date, mct, maxct, stops  )

    nxt_date      = dep_date + 1.day
    voyage  = {:errors => []}
    scheds  = self.effective(dep_date).departing(o).arriving(hub).stops(stops).operating(dep_date)

    if scheds.blank?
          voyage[:errors] << "No Operating Schedule found between #{o} and #{hub} on #{dep_date}"
    end

    flights       = scheds.map{|s| s.to_flight dep_date}
    conn_flights  = []

    if Flight.includes_same_day_arrivals?(flights)
         earliest_arr        =  Flight.earliest_same_day_arrival(flights)
         x_schedules         =  self.effective(dep_date).departing(hub).arriving(d).stops(stops).operating(dep_date)
         x_schedules         =  x_schedules.select{|s| s.dep_time_local.to_i >= earliest_arr.to_i}
         same_day_connx      =  x_schedules.map{|s| s.to_flight dep_date}
         conn_flights        +=  same_day_connx

    end
    if Flight.includes_next_day_arrivals?(flights)
     earliest_arr    =  Flight.earliest_next_day_arrival(flights)
     x_schedules     =  self.effective(nxt_date).departing(hub).arriving(d).stops(stops).operating(nxt_date)
     x_schedules     =  x_schedules.select{|s| s.dep_time_local.to_i >= earliest_arr.to_i}
     overnight_connx =  x_schedules.map{|s| s.to_flight nxt_date}
     conn_flights  +=  overnight_connx
    end
    if conn_flights.blank?
       voyage[:errors] << "No Connecting Schedules found between #{hub} and #{d} on #{dep_date} or #{nxt_date}"
    end
    xmap = {}
    mct_invalid = {}
    flights.each{|flt|  xmap[flt.id] = flt.valid_connections(conn_flights, 0, 1560).pluck(:id)}
    flights.delete_if{|flt|  xmap[flt.id].blank? }

    flights.each do |flt|
      mct_valid_ids   = flt.valid_connections(conn_flights, mct, maxct).pluck(:id)
      mct_invalid_ids =  xmap[flt.id] - mct_valid_ids
      mct_invalid[flt.id] = mct_invalid_ids
      xmap[flt.id]        = mct_valid_ids
    end
    #xmap.delete_if{|k,v| v.blank? } #Don't delete, we want the Empty array
    flights.sort_by!{|flt| flt.dep_time }

    voyage.merge!(f: flights, x:  conn_flights, xmap:  xmap, mct_invalid: mct_invalid)
    voyage

  end

  def cxr_interlines req


    stops = 0
    trips = {}
    o_voyages = []
    return_voyages = []
    o_hubs  = Destination.hubs(req.origin_code,  req.dest_code)

    trips[:ob] = o_voyages
    o_hubs.each do |selected_hub|
      voyage = {hub: selected_hub}
      o_voyages << voyage
      voyage[:journeys]     = cxx_connections(req.origin_code,  req.dest_code, selected_hub,  req.depart,
                                              req.mct, req.maxct, stops)
      voyage[:errors]    += voyage[:journeys][:errors]  unless voyage[:errors].blank?
      voyage[:errors]    = voyage[:journeys][:errors]  if voyage[:errors].blank?
    end
    trips[:rt]    = return_voyages
    if req.owrt.eql? "RT"
      r_hubs  = Destination.hubs(req.dest_code, req.origin_code)
      r_hubs.each do |selected_hub|
        voyage = {hub:selected_hub}
        return_voyages << voyage
        voyage[:journeys]     = cxx_connections(req.dest_code, req.origin_code, selected_hub,  req.ret_date,
                                                req.mct, req.maxct, stops)
        voyage[:errors]  += voyage[:journeys][:errors]  unless voyage[:errors].blank?
        voyage[:errors]   = voyage[:journeys][:errors]  if voyage[:errors].blank?
      end
    end
    return trips

  end

  def hub_interlines req

    stops = 0
    stops = req.stops unless req.stops.blank?
    trips = {}
    o_voyages = []
    return_voyages = []
    trips[:ob] = o_voyages
    voyage = {hub: req.mode_key}
    o_voyages << voyage
    voyage[:journeys]     = hub_connections(req.origin_code,  req.dest_code, req.mode_key,  req.depart,
                                            req.mct, req.maxct, stops)

    voyage[:errors]    += voyage[:journeys][:errors]  unless voyage[:errors].blank?
    voyage[:errors]    = voyage[:journeys][:errors]  if voyage[:errors].blank?

    trips[:rt]    = return_voyages
    if req.owrt.eql? "RT"
      return_voyage = {hub: req.mode_key}
      return_voyages << return_voyage
      return_voyage[:journeys] = hub_connections(req.dest_code,  req.origin_code, req.mode_key, req.ret_date,
                                                 req.mct, req.maxct, stops)
      return_voyage[:errors]    += return_voyage[:journeys][:errors]  unless return_voyage[:errors].blank?
      return_voyage[:errors]    = return_voyage[:journeys][:errors]  if return_voyage[:errors].blank?
    end

    return trips

  end

  end # End Class << self

  def to_flight ldate

    Flight.new(self, ldate)

  end

  def as_json(options={})
     super(options.merge(:except => [:created_at, :updated_at] ))
  end


##############################
#
# Instance Methods
#
#################

  def mkt_carriers_flights
    self.mkt_cxrs.split ';'
  end
  def mkt_carriers
    (self.mkt_cxrs.split ';').map{|v| (v.split ' ')[0]}
  end

  def effective_window sched
    begin_date =  [self.eff_date, sched.eff_date].max
    end_date = [self.disc_date, sched.disc_date].min
    return {eff: begin_date, disc: end_date} if begin_date <= end_date
    return nil
  end

  def day_of_week_aligned? sched


  end



  private
  def self.format_trip_type val
    case val
      when 0
        "OW"
      when 1
        "RT"
      when /RT|OW/
        val
      else
        "OW"
    end
  end

end


 #attr_accessible :origin, :origin_terminal, :dest
 #attr_accessible :service, :seats, :first_seats, :bus_seats , :economy_seats
 #attr_accessible :duration, :flight_time, :ground_time
 #:duration
 #ogn =  OAG_Airport.where(:code => row[:DepAirport], :name => row[:DepAirportName]).first_or_create(
 #                    :city_code => row[:DepCity], :city_name => row[:DepCityName]),
 #                    :city_state => row[:DepState], :city_state_name => row[:DepStateName],
 #                    :iata_country => row[:DepIATACtry] , :iata_country_name => row[:DepIATACtryName],
 #                    :dot_country => row[:DepDOTCtry], :dot_country_name => row[:DepDOTCtryName],
 #                    :region => row[:DepReg], :region_name => row[:DepRegName])
 #dst =  OAG_Airport.where(:code => row[:ArrAirport], :name => row[:ArrAirportName]).first_or_create(
 #                    :city_code => row[:ArrCity], :city_name => row[:ArrCityName]),
 #                    :city_state => row[:ArrState], :city_state_name => row[:ArrStateName],
 #                    :iata_country => row[:ArrIATACtry] , :iata_country_name => row[:ArrIATACtryName],
 #                    :dot_country => row[:ArrDOTCtry], :dot_country_name => row[:ArrDOTCtryName],
 #                    :region => row[:ArrReg], :region_name => row[:ArrRegName])

#:origin => ogn, :origin_terminal => row[:DepTerminal], :dest => dst,
#:service	=> row[:Service], :seats => row[:Seats],
#:first_seats => row[:FstSeats], :bus_seats => row[:BusSeats], :economy_seats => row[:EcoSeats],
#:flight_time => row[:FlyingTime], :ground_time => row[:GroundTime],
#=> row[:FreightTons],											=> row[:PassClass]
#=> row[:FreightClass],											=> row[:Routing]
#=> row[:StatMiles],											=> row[:NautMiles]
#=> row[:Km],											=> row[:DistStMiles]
#=> row[:DistNtMiles],											=> row[:DistKm]
#=> row[:Restrictions],											=> row[:ShAirlDes]
#=> row[:MultCDes],											=> row[:DupMarker]
#=> row[:OpCar],											  => row[:Comment]
#=> row[:LongLeg],											=> row[:MaxTakeOffWeight]
#=> row[:SubGovnApp],											=> row[:FltDup]
#=> row[:ShrAirlineDesName],											=> row[:DepWACCountry]
#=> row[:ArrWACCountry],											=> row[:DepWACState]
#=> row[:ArrWACState],											=> row[:DepWACSubcountry]
#=> row[:ArrWACSubcountry],											=> row[:LocalDaysOfOp1]
#=> row[:LocalDaysOfOp2],											=> row[:LocalDaysOfOp3]
#=> row[:LocalDaysOfOp4],											=> row[:LocalDaysOfOp5]
#=> row[:LocalDaysOfOp6],											=> row[:LocalDaysOfOp7]
#=> row[:Frequency],											=> row["Seats (total)"],
#=> ["Frequency share"], => ["Capacity share"],
#=> ["Tonnage (total)"], => row[:ASMs],         => row[:HHI],
#=> ["FlyingTime (minutes)"], => row[:TimeSeries]
# => row[:Carrier2], => row[:Carrier2Name],	=> row[:FlightNo2], => row[:CarrDom2], => row[:CarrDom2Name]
#:cxr_dom => row[:CarrDom1], :cxr_dom_name	=> row[:CarrDom1Name],


 #if last_sched_num.eql?(f_hash[:airline_code] + f_hash[:flight_num])
 #  last_eff_date  = Date.parse last_sched[:eff_date]
 #  last_disc_date = Date.parse last_sched[:disc_date]
 #  eff_date  = Date.parse f_hash[:eff_date]
 #  disc_date = Date.parse f_hash[:disc_date]
 #  if disc_date > last_disc_date
 #     f_hash[:eff_date]  = (last_disc_date + 1).to_s
 #  end
 #
 #end
 #         self.where(sched.merge(:hub => hub)).first_or_create!
