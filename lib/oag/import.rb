require 'csv'
require 'parallel'

module Oag
  class Import



  def body_converters
         return lambda{|s, details|
            begin
              if [:localarrtime,:localdeptime].include? details.header
                "%04d" % s.to_i
              else
                s
              end
            rescue Exception  => ex
              Rails.logger.info ex.message
              s
            end
          }

  end

  def load_schedule(csvdata, options={})
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
             :mkt => row[:routing], :mkt_cxrs => OagSchedule.mkt_cxrs(row),
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

  def process_schedules report, schedules, options={}

    orig_airports = schedules.collect{ |n| n[:origin_apt] }
    dest_airports = schedules.collect{ |n| n[:dest_apt] }
    OagSchedule.where(:report_key => report.report_key).delete_all

    Rails.logger.info "Loading #{schedules.count} schedules into Schedule tables for #{report.report_key}"

    expired       = schedules.select{|sched| Date.parse(sched[:disc_date]) < Date.today}
    report.load_status["expired_schedules_count"] = expired.count

    Rails.logger.info "There are  #{expired.count} expired schedules in the file  for #{report.report_key}."
    schedules.delete_if{|sched| Date.parse(sched[:disc_date]) < Date.today}
    report.load_status['schedules_count'] = schedules.count

    schedule_records = []
    loaded = 0
    schedules.in_groups_of(500) do |schedule_group|
    schedule_group.compact.each do |sched|
      begin
        schedule_records << OagSchedule.new(sched.merge(:report_key => report.report_key))
      rescue Exception => e
          puts sched
          Rails.logger.error sched
          Rails.logger.error e.message
          raise RuntimeError e
      end
    end
    Sidekiq::Logging.logger.info "Loading  #{schedule_records.count} (of #{schedules.count}) valid schedules into the DB  for #{report.report_key}."
    loaded += schedule_records.count
    OagSchedule.import schedule_records
    schedule_records = []
  end
  Sidekiq::Logging.logger.info "--- Loaded  #{loaded} valid schedules into the DB for #{report.report_key} ---"
  report.load_status['report_status'] = 'imported'
  report.save

  end


  def parse_report report

    csv_string  = report.report_file_string


    CSV::Converters[:oag_converters]  = body_converters
    options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
    data    = []
    begin
     data = CSV.parse(csv_string, options)
    rescue Exception  => ex
     Rails.logger.info ex.message
    end
    tstart = Time.now
    report.load_status['processing_time'] = Time.now - tstart
    data
  end

  def parse_large_report(report,line_count)
    csv_file    = File.open(report.load_status['report_path'], 'r')
    file_data    = []
    file_set     = []
    csv_header  = nil
    blocks = 0
    block_size = 5000
    csv_file.each do |line, idx|
     if csv_file.lineno.eql? 1
       csv_header = line
     else
       file_set << line
     end
     if 0.eql? (csv_file.lineno % block_size)
       Sidekiq::Logging.logger.info "Scanning line number #{csv_file.lineno} of #{line_count} #{report.load_status['report_path']}"
       file_data << file_set.dup
       file_set = []
       blocks += 1
     end
    end
    csv_file.close


    CSV::Converters[:oag_converters]  = body_converters
    options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
    parsed_data = []
    parsed_data = Parallel.map_with_index(file_data, :in_processes=>3) do |csv_set, idx|
     csv_set.unshift csv_header
     csv_string = csv_set.join
     begin
       parsed_set = CSV.parse(csv_string, options)
       Rails.logger.info "Parsing Block # #{idx+1} of #{blocks} blocks containing #{block_size} rows."
       parsed_set
     rescue Exception  => ex
            Rails.logger.info ex.message
     end
    end


  end


  def parse_and_load_report report

    # Read remaining rows as CSV file
    line_count = %x{wc -l < "#{report.load_status['report_path']}"}.to_i
    if line_count < 100000
       report.load_status['report_status'] = 'parsing'
       report.save
       schedule_rows = parse_report(report)
       schedules     = load_schedule(schedule_rows)

       process_schedules(report, schedules)
    else
       schedule_rows = parse_large_report(report,line_count)
       schedules = []
       schedule_rows.each do |csv_data_set|
             schedules << self.load_schedule(csv_data_set, options={})
       end
       schedules.flatten!
       process_schedules(report, schedules)

    end

  end



  end
end
