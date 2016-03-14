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



       # TODO: We may need to add a local arrival day as an integer, in the event that there are flights
       # TODO: that could possibly span two day timezone, I don't think this is possible, but Ryan Air had a schedule
       # TODO: mistake that had a '2' in the localarrday value, and so now we are just looking for > 0 in the boolean
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
             :next_day_arrival => (not row[:localarrday].nil? and
                 (0 + row[:localarrday].to_i)  > 0),
             :dep_op_days => row[:localdaysofop].gsub(/\s+/, "").scan(/./).map(&:to_i), :arr_op_days => [],
             :duration    => row[:elapsedtime],
             :stops => row[:stops],  :restrictions => row[:restrictions],
             :mkt => row[:routing], :mkt_cxrs => OagSchedule.mkt_cxrs(row),
             :via_apts => row[:intairports],
             :distance_km => row[:distkm].to_i.to_s == row[:distkm] ?  row[:distkm].to_i : 0

         }
         if sched[:next_day_arrival]
           sched[:arr_op_days] = sched[:dep_op_days].map{|d| d + 1}
           sched[:arr_op_days].map{|d|  d <= 7 ? d : d % 7 }
           sched[:arr_op_days].sort!
         else
           sched[:arr_op_days] = sched[:dep_op_days]
         end

         if row[:opcar].eql? 'O'
            sched[:op]  = true
          else
            sched[:op]  = false
         end

         # Set Operating Carrier Info
         if sched[:op]
           if not sched[:shared_airline_code].blank? and not sched[:shared_airline_code].eql? '0'
             sched[:op_cxr_code] = sched[:shared_airline_code]
             sched[:op_cxr_name] = sched[:shared_airline_name]
              sched[:op_flight_num] = sched[:flight_num]
           else
             sched[:op_cxr_code]   = sched[:airline_code]
             sched[:op_cxr_name]   = sched[:airline_name]
             sched[:op_flight_num] = sched[:flight_num]
           end
         else # When Flight is a marketing flight, the dupcar1 field contains the operating carrier flight info
           if not row[:dupcar1].eql? '0' and not row[:dupcar1].blank?
             op_data = row[:dupcar1].split ' '
             sched[:op_cxr_code] = op_data[0]
             sched[:op_flight_num] = op_data[1]
              # The operating carrier name is usually in the shared airline name field
             if sched[:op_cxr_code].eql? sched[:shared_airline_code]
                  sched[:op_cxr_name] = sched[:shared_airline_name]
              else  # If not, just look it up by code
                if Airline.by_code(sched[:op_cxr_code])
                     sched[:op_cxr_name] = Airline.by_code(sched[:op_cxr_code]).name
             else
                     sched[:op_cxr_name] = "Unknown Carrier"
                     Rails.logger.error "Unknow Carrier #{sched[:op_cxr_code]} #{sched}"
                end
              end
           else # Operating Carrier Information is Missing from DupCar field

             if not sched[:shared_airline_code].blank? and not sched[:shared_airline_code].eql? '0' and
                not sched[:shared_airline_name].blank? and not sched[:shared_airline_name].eql? '0'
            sched[:op_cxr_code] = sched[:shared_airline_code]
            sched[:op_cxr_name] = sched[:shared_airline_name]
                   sched[:op_flight_num] = sched[:flight_num]

           end
         end

         end


         schedules << sched
      end
      schedules.delete_if{|s| s[:disc_date].blank?}
      schedules.uniq
  end

  def process_schedule_chunk(schedule_set, schedules, options={})
    orig_airports = schedules.collect{ |n| n[:origin_apt] }
    dest_airports = schedules.collect{ |n| n[:dest_apt] }
    expired       = schedules.select{|sched| Date.parse(sched[:disc_date]) < Date.today}

    schedule_set.stash_log "Loading chunk of #{schedules.count} schedules into Schedule tables for #{schedule_set.report_key_code}"

    schedule_set.load_status['expired_schedules_count'] = 0 unless schedule_set.load_status.has_key?('expired_schedules_count')
    schedule_set.load_status['schedules_count']         = 0 unless schedule_set.load_status.has_key?('schedules_count')
    schedule_set.load_status['expired_schedules_count'] +=  expired.count
    schedules.delete_if{|sched| Date.parse(sched[:disc_date]) < Date.today}
    schedule_set.load_status['schedules_count'] +=  schedules.count
    schedule_set.save


    schedule_set.stash_log "There are  #{expired.count} expired schedules in chunk  for #{schedule_set.report_key_code}."
    schedule_set.stash_log "There are  #{schedule_set.load_status['expired_schedules_count']} expired schedules so far  for #{schedule_set.report_key_code}."
    schedule_set.stash_log "There are  #{schedule_set.load_status['schedules_count']} schedules so far for #{schedule_set.report_key_code}."


    schedule_records = []
    loaded = 0
    group_size = 500
    schedule_count = schedules.count
    schedules.in_groups_of(group_size) do |schedule_group|
      schedule_group.compact.each do |sched|
        begin

          sched.merge!(report_key_id: schedule_set.report_key_id, schedule_set_id: schedule_set.id)
          oag_sched = OagSchedule.new(sched)
          schedule_records << oag_sched

         
        rescue Exception => e
            Rails.logger.error sched
            Rails.logger.error e.message
            raise RuntimeError, e
        end
      end
      schedule_set.stash_log "Loading  #{schedule_records.count} (of #{schedule_count } from #{schedules.count}) valid schedules into the DB  for #{schedule_set.report_key_code}."
      schedule_count = schedule_count - schedule_records.count
      loaded += schedule_records.count
      OagSchedule.import schedule_records
      schedule_records = []
    end
    schedule_set.stash_log "--- Loaded  #{loaded} valid schedules into the DB for #{schedule_set.report_key_code} ---"
  end

  def process_schedules(schedule_set, schedules, options={})

    orig_airports = schedules.collect{ |n| n[:origin_apt] }
    dest_airports = schedules.collect{ |n| n[:dest_apt] }
    # OagSchedule.keyed(schedule_set.schedule_set_key).delete_all

    schedule_set.stash_log "Loading #{schedules.count} schedules into Schedule tables for #{schedule_set.report_key_code}"
    expired       = schedules.select{|sched| Date.parse(sched[:disc_date]) < Date.today}
    schedule_set.load_status['expired_schedules_count'] = expired.count

    schedule_set.stash_log "There are  #{expired.count} expired schedules in the file  for #{schedule_set.report_key_code}."
    schedules.delete_if{|sched| Date.parse(sched[:disc_date]) < Date.today}
    schedule_set.load_status['schedules_count'] = schedules.count

    schedule_records = []
    loaded = 0
    group_size = 2000
    schedule_count = schedules.count

    schedules.in_groups_of(group_size) do |schedule_group|
    schedule_group.compact.each do |sched|
      begin
        sched.merge!(report_key_id: schedule_set.report_key_id, schedule_set_id: schedule_set.id)
        oag_sched = OagSchedule.new(sched)
        schedule_records << oag_sched

      rescue Exception => e
          Rails.logger.error sched
          Rails.logger.error e.message
          raise RuntimeError, e
      end
    end
    schedule_set.stash_log "Loading  #{schedule_records.count} (of #{schedule_count } from #{schedules.count}) valid schedules into the DB  for #{schedule_set.report_key_code}."
    schedule_count = (schedule_count - schedule_records.count)

    loaded += schedule_records.count
    OagSchedule.import schedule_records
    schedule_records = []
  end
  schedule_set.stash_log "--- Loaded  #{loaded} valid schedules into the DB for #{schedule_set.report_key_code} ---"
  schedule_set.load_status['report_status'] = 'imported'
  schedule_set.save

  end


  def parse_report schedule_set

    csv_string  = schedule_set.report_file_string


    CSV::Converters[:oag_converters]  = body_converters
    options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}
    data    = []
    begin
     data = CSV.parse(csv_string, options)
    rescue Exception  => ex
     Rails.logger.error ex.message
    end
    tstart = DateTime.now.in_time_zone
    schedule_set.load_status['processing_time'] = DateTime.now.in_time_zone  - tstart
    data
  end

  def parse_large_report(schedule_set)
    line_count  = schedule_set.attachment_lines
    block_size  = 2000
    block_count = line_count / block_size
    block_mod   = line_count % block_size
    blocks = (block_mod.eql? 0 ) ? block_count : block_count + 1


    schedule_set.load_status['report_line_ptr'] = 2 unless schedule_set.load_status.has_key? 'report_line_ptr'
    CSV::Converters[:oag_converters]  = body_converters
    options = {:headers => true, :header_converters => :symbol, :converters => [:oag_converters]}

    # Oag::Util.release_forked_process_postgres_db_connection

    schedule_rows = Parallel.map_with_index([0,1,2], in_processes:3) do |batch_number|
      Oag::Util.refresh_forked_process_postgres_db_connection


      starting_row = (batch_number * block_size) + schedule_set.load_status['report_line_ptr']
      end_row      = block_size + starting_row
      csv_row_num  = 2
      csv_rows     = []
      begin
        CSV.foreach(schedule_set.load_status['report_path'], options) do |row|
          begin
            if csv_row_num.eql?  end_row
               break
            end
            if csv_row_num >= starting_row
              if csv_row_num.eql? starting_row
                schedule_set.stash_log "Parsing Block # #{starting_row/block_size} of #{blocks} blocks containing #{block_size} rows."
                schedule_set.stash_log "Scanning line numbers #{csv_row_num}-#{end_row} of #{line_count} #{schedule_set.load_status['report_path']}"
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

    Oag::Util.refresh_forked_process_postgres_db_connection

    schedule_rows.flatten!
    schedule_set.load_status['report_line_ptr'] = schedule_set.load_status['report_line_ptr'] + schedule_rows.count
    schedule_set.stash_log "Scanned #{schedule_rows.count} rows of #{schedule_set.load_status['report_path']}"
    schedule_rows

  end


  def parse_and_load_report(schedule_set)

    # Read remaining rows as CSV file
    schedule_rows = parse_report(schedule_set)
    schedules     = load_schedule(schedule_rows)
    process_schedules(schedule_set, schedules)

  end

  def parse_and_load_large_report(schedule_set)
    begin
      schedule_rows = parse_large_report(schedule_set)
    rescue Exception => ex
      Rails.logger.error ex.message
    end
    schedules = []

    # TODO:  If file is to large to load into memory, load it in with chunks, and process each chunk
    # schedule_rows.each do |csv_data_set|
    schedules << self.load_schedule(schedule_rows, options={})
    # end

    schedules.flatten!
    OagSchedule.keyed(schedule_set.report_key).delete_all

    # TODO: Currently This is not doing anything different than process schedules.
    # Needs to process them in chunks.
    process_schedule_chunk(report, schedules)
    if schedule_set.load_status['report_line_ptr'].to_i >= schedule_set.attachment_lines
      # schedule_set.report_status = 'schedules_loaded'
      schedule_set.stash_log "There were  #{schedule_set.load_status['expired_schedules_count']} expired schedules in the file  for #{schedule_set.report_key_code}."

    end

  end



  end
end
