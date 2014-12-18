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
              Rails.logger.error ex.message
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
      schedules.delete_if{|s| s[:disc_date].blank?}
      schedules.uniq
  end
  def process_schedule_chunk(report, schedules, options={})
    orig_airports = schedules.collect{ |n| n[:origin_apt] }
    dest_airports = schedules.collect{ |n| n[:dest_apt] }
    expired       = schedules.select{|sched| Date.parse(sched[:disc_date]) < Date.today}
    report.load_status['expired_schedules_count'] = 0 unless report.load_status.has_key?('expired_schedules_count')
    report.load_status['schedules_count']         = 0 unless report.load_status.has_key?('schedules_count')
    report.load_status['expired_schedules_count'] +=  expired.count
    schedules.delete_if{|sched| Date.parse(sched[:disc_date]) < Date.today}
    report.load_status['schedules_count'] +=  schedules.count
    schedule_records = []
    loaded = 0
    schedules.in_groups_of(500) do |schedule_group|
      schedule_group.compact.each do |sched|
        begin
          schedule_records << OagSchedule.new(sched.merge(:report_key => report.report_key))
        rescue Exception => e
            Rails.logger.error sched
            Rails.logger.error e.message
            raise RuntimeError, e
        end
      end
      Rails.logger.info "Loading  #{schedule_records.count} (of #{schedules.count}) valid schedules into the DB  for #{report.report_key}."
      loaded += schedule_records.count
      OagSchedule.import schedule_records
      schedule_records = []
    end
    Rails.logger.info "--- Loaded  #{loaded} valid schedules into the DB for #{report.report_key} ---"
    report.report_status = 'importing'
    report.save
  end

  def process_schedules(report, schedules, options={})

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
          Rails.logger.error sched
          Rails.logger.error e.message
          raise RuntimeError, e
      end
    end
    Rails.logger.info "Loading  #{schedule_records.count} (of #{schedules.count}) valid schedules into the DB  for #{report.report_key}."
    loaded += schedule_records.count
    OagSchedule.import schedule_records
    schedule_records = []
  end
  Rails.logger.info "--- Loaded  #{loaded} valid schedules into the DB for #{report.report_key} ---"
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
     Rails.logger.error ex.message
    end
    tstart = Time.now
    report.load_status['processing_time'] = Time.now - tstart
    data
  end

  def parse_large_report(report)
    line_count  = report.attachment_lines
    block_size  = 2000
    block_count = line_count / block_size
    block_mod   = line_count % block_size
    blocks = (block_mod.eql? 0 ) ? block_count : block_count + 1


    report.load_status['report_line_ptr'] = 2 unless report.load_status.has_key? 'report_line_ptr'
    CSV::Converters[:oag_converters]  = body_converters
    options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}

    # Oag::Util.release_concurrent_postgres_db_connection

    schedule_rows = Parallel.map_with_index([0,1,2], in_processes:3) do |batch_number|
      Oag::Util.refresh_concurrent_postgres_db_connection


      starting_row = (batch_number * block_size) + report.load_status['report_line_ptr']
      end_row      = block_size + starting_row
      csv_row_num  = 2
      csv_rows     = []
      begin
        CSV.foreach(report.load_status['report_path'], options) do |row|
          begin
            if csv_row_num.eql?  end_row
               break
            end
            if csv_row_num >= starting_row
              if csv_row_num.eql? starting_row
                Rails.logger.info "Parsing Block # #{starting_row/block_size} of #{blocks} blocks containing #{block_size} rows."
                Rails.logger.info "Scanning line numbers #{csv_row_num}-#{end_row} of #{line_count} #{report.load_status['report_path']}"
              end
              csv_rows << row
            end
            csv_row_num += 1
          rescue Exception => ex
            Rails.logger.error ex.message
          end
        end
      rescue Exception => ex
        Rails.logger.error ex.message
      end
      csv_rows
    end

    Oag::Util.refresh_concurrent_postgres_db_connection

    schedule_rows.flatten!
    report.load_status['report_line_ptr'] = report.load_status['report_line_ptr'] + schedule_rows.count
    Rails.logger.info "Scanned #{schedule_rows.count} rows of #{report.load_status['report_path']}"
    schedule_rows

  end


  def parse_and_load_report(report)

    # Read remaining rows as CSV file
    schedule_rows = parse_report(report)
    schedules     = load_schedule(schedule_rows)
    process_schedules(report, schedules)

  end

  def parse_and_load_large_report(report)

    if report.report_status.eql? 'queued'
      OagSchedule.where(:report_key => report.report_key).delete_all
      report.report_status = 'importing'
    end
    begin
      schedule_rows = parse_large_report(report)
    rescue Exception => ex
      Rails.logger.error ex.message
    end
    schedules = []
    # schedule_rows.each do |csv_data_set|
    schedules << self.load_schedule(schedule_rows, options={})
    # end
    schedules.flatten!
    process_schedule_chunk(report, schedules)
    if report.load_status['report_line_ptr'].to_i >= report.attachment_lines
      report.report_status = 'schedules_loaded'
      Rails.logger.info "There were  #{report.load_status['expired_schedules_count']} expired schedules in the file  for #{report.report_key}."

    end

  end



  end
end
