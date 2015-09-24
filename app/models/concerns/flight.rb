class Flight
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend Forwardable

  def_delegators :@s, :airline_code, :airline_name, :flight_num, :origin_apt, :dest_apt
  def_delegators :@s, :dep_op_days, :arr_op_days, :stops, :mkt, :mkt_cxrs, :duration
  def_delegators :@s, :dep_time_local, :arr_time_local, :next_day_arrival
  def_delegators :@s, :eff_date, :disc_date



  attr_accessor :dep_date, :arr_date, :id

  #attr_accessor :id
  #attr_accessor :dep_date, :arr_date
  #attr_accessor :airline_code, :airline_name, :flight_num
  #attr_accessor :origin_apt
  #attr_accessor :dest_apt
  #attr_accessor :duration
  #
  #attr_accessor :dep_time_local, :arr_time_local, :next_day_arrival
  #attr_accessor :dep_op_days, :arr_op_days
  #attr_accessor :stops, :mkt, :mkt_cxrs
  def self.earliest flights
     flights.sort_by{|f| f.arr_time_local.to_i }.first.arr_time_local
  end

  def self.earliest_arrival_time flights
    flights.sort_by!{|flt| flt.arr_time}.first.arr_time
  end
  def self.earliest_same_day_arrival flights
     flights.select{|flt| !flt.next_day?}.sort_by{|flt| flt.arr_time_local.to_i }.first.arr_time_local
  end
  def self.earliest_next_day_arrival flights
    flights.select{|flt| flt.next_day?}.sort_by{|flt| flt.arr_time_local.to_i }.first.arr_time_local
  end

  def self.includes_next_day_arrivals? flights
    flights.each{|flt| return true if flt.next_day?}
    return false
  end
  def self.includes_same_day_arrivals? flights
    flights.each{|flt| return true if !flt.next_day?}
    return false
  end



  def initialize sched, ldate
    #args.each do |k,v|
    #    instance_variable_set("@#{k.to_s}", v) unless v.nil?
    #end
    @s = sched    # prepare delegate object
    @dep_date = ldate
    @arr_date = next_day? ? ldate + 1.day : ldate
    @id = @s.id + dep_date.to_time.to_i
  end

  #def to_flight ldate
  #  flt_h = self.attributes.symbolize_keys
  #    .except(:eff_date, :disc_date, :updated_at, :created_at)
  #    .merge(:dep_date => ldate)
  #    .merge(:arr_date => (self.next_day?) ? ldate + 1.day : ldate)
  #  Oag_Flight.new(flt_h)
  #end

  def flight_num_string
    "#{airline_code}#{flight_num}"
  end

  def render
    "#{dep_date} #{airline_code} #{flight_num} #{origin_apt} #{dep_time_local} #{arr_date} #{dest_apt } #{arr_time_local}"
  end
  def dep_time
    dep_date.to_datetime + dep_time_loc_minutes.minutes
  end
  def arr_time
    arr_date.to_datetime + arr_time_loc_minutes.minutes
  end

  def next_day?
    next_day_arrival.eql? "1" or
    next_day_arrival.eql? true
  end
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
  def mct_overnight? mct
    (arr_minutes_since_midnight + mct) >= 1440
  end

  def x_time(flt)
     return flt.dep_minutes_since_midnight - arr_minutes_since_midnight
  end

  def mct_valid?(flt,mct)
      x_time(flt) >= mct
  end

  def maxct_valid?(flt,maxct)
    maxct >= x_time(flt)
  end


  def connection_time connection
    ((connection.dep_time - arr_time) * 24 * 60).to_i
  end

  def connections_with_times conn_flights
    conn_flights.map{|flt| {:ct => connection_time(cnx), :connection =>flt }}
  end
  def valid_connections conn_flights, mct, maxct
    xn = conn_flights.select{|cnx| connection_time(cnx).between?(mct, maxct) }
  end



  def same_day_later(flt, mct = 0)
    flt.dep_date.eql? @arr_date and
        arr_time_local.to_i + mct <= flt.dep_time_local.to_i

  end
  def next_day_later(flt, mct = 0)
    flt.dep_date > @arr_date and !mct_overnight?(mct)
  end
  def overnight_later(flt, mct = 0)
    mct_overnight?(mct) and
    flt.dep_date > @arr_date and
    (arr_minutes_till_midnight + flt.dep_minutes_since_midnight) >= mct
  end

  def later_than(flt, mct = 0)
    same_day_later(flt,mct) or
    next_day_later(flt,mct) or
    overnight_later(flt,mct)
  end



end
