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



  #attr_accessible :hub, :cxr
  #attr_accessible :eff_date, :disc_date
  #attr_accessible :airline_code, :airline_name, :flight_num
  #attr_accessible :origin_apt, :dest_apt
  #attr_accessible :duration
  #
  #attr_accessible :dep_time_local, :arr_time_local, :next_day_arrival
  #attr_accessible :dep_op_days, :arr_op_days
  #attr_accessible :stops, :mkt, :mkt_cxrs



  scope :keyed,     lambda {|report_key| where("report_key = ?",  report_key)}
  scope :branded,   lambda {|report_keys| where("report_key IN (?)",  report_keys)}
  scope :for_cxr,   lambda {|cxr| where(:airline_code => cxr)}
  scope :for_cxrs,  lambda {|carriers| carriers.empty? ? where.not(:airline_code => nil) :
                              where(:airline_code =>  carriers)
                            }
  #scope :except_cxrs lambda {|carriers| where.not(:conditions => {:airline_code => carriers})}
  scope :effective, lambda {|theDay| where('? BETWEEN eff_date and disc_date', theDay ) }
  scope :arriving,        lambda {|dest|   where(:dest_apt => dest)            }
  scope :departing,       lambda {|origin| where(:origin_apt =>  origin)       }
  scope :market,          lambda {|o,d|    where(:origin_apt =>  o, :dest_apt => d)}
  scope :connecting,          lambda {|o,d|    where(:origin_apt =>  o, :dest_apt => d)}





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


  def plated_flt_number
     "#{airline_code} #{flight_num}"
  end

  class << self


    def origins(report)
      keyed(report.report_key).pluck(:origin_apt, :origin_apt_name, :origin_apt_city).uniq || []
    end

    def destinations(report)
      keyed(report.report_key).pluck(:dest_apt, :dest_apt_name, :dest_apt_city).uniq || []
    end

    def later_than(dep_time)
       where("CAST(arr_time_local as UNSIGNED) >= ?", dep_time)
    end

    def stops(num)
      where(:stops => num)
    end

    def operating(dep_date)
      where.any(dep_op_days: dep_date.cwday)
      # Use PostGres ext operator instead of Regexp
      # where(dep_op_days "dep_op_days ~* '.*?.*'", )
    end


    def travelling_on(dep_date)
      where.between(dep_date  '? BETWEEN eff_date and disc_date', dep_date ).operating(dep_date)

    end

    def carriers_for_key(data_key)
      keyed(data_key).pluck(:airline_code).uniq!
    end

    def carriers_details_for_report(report)
      keyed(report.report_key).pluck(:airline_code, :airline_name).uniq!
    end






    def mkt_cxrs row
      mkt_cxrs = [row[:dupcar1], row[:dupcar2], row[:dupcar3], row[:dupcar4],
                  row[:dupcar5], row[:dupcar6], row[:dupcar7], row[:dupcar8]].compact
      mkt_cxrs.delete_if{|v| v.eql? '0'}
      mkt_cxrs.join ';'
    end




    def connecting_flights(data_key, travel_date, o, d, stops, mct, maxct, earliest_arrival_time, is_next_day_arrival,cxrs)
      conn_flights    = []
      last_date = (earliest_arrival_time + maxct.minutes).to_date
      dates =*(earliest_arrival_time.to_date..last_date)
      dates.each do |arrival_date|
        x_schedules   =  keyed(data_key).connecting(o,d).travelling_on(arrival_date).for_cxrs(cxrs).stops(stops)
        x_flights     =  x_schedules.map{|s| s.to_flight arrival_date}
        conn_flights += x_flights.select{|flt| flt.dep_time >= earliest_arrival_time}
      end
      conn_flights.sort_by!{|flt| [flt.dep_date, flt.dep_time_local]}.each{|flt| puts flt.render}
      conn_flights
    end

    def connections_via_hub(data_key, o, d, hub, travel_date, mct, maxct, stops, cxrs)
        errors = []
        scheds  = keyed(data_key).connecting(o, hub).for_cxrs(cxrs).travelling_on(travel_date).stops(stops)

        if scheds.blank?
             errors << "No Operating Schedule found between #{o} and #{hub} on #{travel_date}"
        end
        flights       = scheds.map{|s| s.to_flight travel_date}
        conn_flights  = []

        unless flights.blank?
         earliest_arr_time = Flight.earliest_arrival_time(flights)
         flights.each{ |flt| puts flt.render}
         conn_flights = connecting_flights(data_key, travel_date, hub, d, stops, mct, maxct, earliest_arr_time, false, cxrs)
        end



        if conn_flights.blank?
           errors << "No Connecting Schedules found between #{hub} and #{d} on #{travel_date} to #{maxct} minutes"
        end
        selected_connections = {}
        mct_invalid = {}

        flights.each do |flt|
          connections                   =  conn_flights.map{|cnx| Connection.new(:leg_1 => flt, :leg_2 => cnx) }
          selected_connections[flt.id]  =  connections.select{|cnx| cnx.connect_time.between?(mct, maxct)}.map{|cnx| cnx.leg_2.id}
          mct_invalid[flt.id]  =  connections.select{|cnx| not cnx.connect_time.between?(mct, maxct)}.map{|cnx| cnx.leg_2.id}
        end
        conn_flights.sort_by!{|flt| [flt.dep_date, flt.dep_time] }
        flights.sort_by!{|flt| [flt.dep_date, flt.dep_time] }

        {f: flights, x:  conn_flights, xmap:  selected_connections, mct_invalid: mct_invalid,errors: errors}

    end

    def single_hub_connections(req)

      o_hubs  = Destination.hubs(req.data_key, req.origin_code,  req.dest_code)
      trips = {}
      o_voyages, rt_voyages = [],[]
      trips[:ob] = o_voyages
      o_hubs.each do |selected_hub|
        voyage = {hub: selected_hub}
        voyage[:journeys] = connections_via_hub(req.data_key, req.origin_code, req.dest_code, selected_hub, req.depart, req.mct, req.maxct, req.stops, req.cxrs)
        voyage[:errors]    += voyage[:journeys][:errors]  unless voyage[:errors].blank?
        voyage[:errors]     = voyage[:journeys][:errors]  if voyage[:errors].blank?
        o_voyages << voyage

      end
      trips[:rt]    = rt_voyages
      if req.owrt.eql? "RT"
       r_hubs  = Destination.hubs(req.data_key, req.dest_code,  req.origin_code)
       r_hubs.each do |selected_hub|
         voyage = {hub: selected_hub}
         voyage[:journeys] = connections_via_hub(req.data_key, req.dest_code, req.origin_code, selected_hub, req.ret_date, req.mct, req.maxct, req.stops, req.cxrs)
         voyage[:errors]    += voyage[:journeys][:errors]  unless voyage[:errors].blank?
         voyage[:errors]     = voyage[:journeys][:errors]  if voyage[:errors].blank?
         rt_voyages << voyage
       end
      end
      trips
    end


    def search_interlines req
        trips   = {}
        o_voyages = []
        return_voyages = []

        directs = {}
        o_flights = []
        return_flights = []

        if req.include_direct
          o_flights =  keyed(req.data_key)
                        .connecting(req.origin_code, req.dest_code).effective(req.dep_date)
                        .stops(req.stops).operating(dep_date).map{|s| s.to_flight dep_date}


          rt_flights = []
          if req.owrt.eql? "RT"
            rt_flights = keyed(req.data_key)
                          .connecting(req.dest_code, req.origin_code).effective(req.ret_date)
                          .stops(req.stops).operating(ret_date).map { |s| s.to_flight ret_date}
          end
          directs[:ob] = o_flights
          directs[:rt] = rt_flights
        end

        
        one_hub_trips = single_hub_connections(req)
        answers =  {directs: directs, one_hub_trips: one_hub_trips}
        return answers
    end

  end # End Class << self

  def to_flight ldate

    Flight.new(self, ldate)

  end


  def dow_table
    unless @arrivals_to_departures
      # => {1=>[1, 2], 2=>[2, 3], 3=>[3, 4], 4=>[4, 5], 5=>[5, 6], 6=>[6, 7], 7=>[7, 1]}
      @arrivals_to_departures = Hash[*([*1..7].map{ |daynum| [daynum, daynum == 7 ? [7,1] : [daynum, daynum+1]] }.flatten(1))]
    end
    return @arrivals_to_departures
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

  def effective_overlaps? sched
    (self.eff_date..self.disc_date).overlaps?(sched.eff_date..sched.disc_date)
   end

  def effective_dates
    {eff: self.eff_date,
     disc: self.disc_date}
  end

  def effective_window sched
    if self.effective_overlaps?(sched)
      {eff: [self.eff_date,sched.eff_date].max,
       disc: [self.disc_date,sched.disc_date].min}
    else
      nil
    end
  end




  def connection_days_of_week sched, up_to_days

    departure_days_with_connections = []
    self.dep_op_days.each do |day_num|
      if sched.dep_op_days.include?(day_num) and
          (self.arr_time_loc_minutes + 60) < sched.dep_time_loc_minutes
          departure_days_with_connections << day_num
      elsif up_to_days > 0


      #  Add the number of days to each operating day of departure to create a range
      #  Add the same number to the connecting schedule to account for overruns
      #  So if we had 6 as the daynum, and 2 as the 'extra' days, then we'll test if 6, 7, or 8 is in the
      #  connecting array if it is then Departing Day six can connect on the 6th, the 7th or the 8th Day.
        unless (dow_table[day_num] & sched.dep_op_days).blank?
           departure_days_with_connections << day_num
        end

      end
    end
    departure_days_with_connections

  end




  # def x_time(sched2)
  #     return sched2.dep_minutes_since_midnight - self.arr_minutes_since_midnight
  #  end

  def dep_time_loc_minutes
      dep_minutes_since_midnight
  end
  def dep_minutes_since_midnight
    (dep_time_local[0..1].to_i * 60) + dep_time_local[2..3].to_i
  end
  def dep_minutes_since_prev_midnight
      1440 + dep_minutes_since_midnight
  end
  def arr_time_loc_minutes
     arr_minutes_since_midnight
  end
  def arr_minutes_since_midnight
    (arr_time_local[0..1].to_i * 60) + arr_time_local[2..3].to_i
  end
  def arr_minutes_since_prev_midnight
    1440 + arr_minutes_since_midnight
  end
  def arr_minutes_till_midnight
    1440 - arr_minutes_since_midnight
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
