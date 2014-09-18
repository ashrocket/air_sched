require 'thread'
require 'mastiff'

module Oag
  class Process
    #def job_from_filename(job_type, filename)
    #   test_string = filename.upcase
    #   matches = test_string.match(/#{job_type}[^a-zA-Z0-9]?([a-zA-Z0-9]+)/)
    #   key = matches.blank? ? nil : matches.captures.first
    #   ext = File.extname(filename)
    #   case ext
    #   when /\.zip/
    #     {job: job_type, key: key, archive: filename}
    #   else
    #     {job: job_type, key: key, tmpfile: filename }
    #   end
    #end
    #def process_attachment msg_id
    #case job[:job]
    #  when /HUB/
    #    process_hub job
    #  when /CXX/
    #    process_cxx job
    #end
    #end
    #def process_job job
    #  case job[:job]
    #    when /HUB/
    #      process_hub job
    #    when /CXX/
    #      process_cxx job
    #  end
    #end
    def refresh_airports report
        origins      = OagSchedule.keyed(report.report_key).pluck(:origin_apt, :origin_apt_name, :origin_apt_city).uniq
        destinations = OagSchedule.keyed(report.report_key).pluck(:dest_apt, :dest_apt_name, :dest_apt_city).uniq
        airports = (origins + destinations).uniq!
        airports.each do |airport|
           apt = Airport.where(code: airport[0]).first_or_create!
           apt.name = airport[1]
           apt.city = airport[2]
           apt.save
        end
        report.report_status = 'airports_refreshed'
        report.save
    end

    def refresh_direct_flights(report)
        DirectFlight.keyed(report.report_key).delete_all
        direct_flight_records = []

        schedules = OagSchedule.keyed(report.report_key).select(:origin_apt, :dest_apt, :airline_code, :mkt_cxrs ).distinct
        grouped_schedules = schedules.group_by{|flt| [flt.origin_apt, flt.dest_apt] }.map{ |apt_pair,sched_a|
                                       [apt_pair, (sched_a.map{|sched| sched.airline_code } +
                                             sched_a.map{|sched| sched.mkt_carriers}.flatten(1)).uniq]}
        grouped_schedules.sort!
        grouped_schedules.each do |combo|
          direct_flight_records << DirectFlight.new(report_key: report.report_key, origin: combo[0][0], dest: combo[0][1], carriers: combo[1])
        end
        DirectFlight.import direct_flight_records
        report.report_status = 'direct_flights_refreshed'
        report.save
    end

    def refresh_destinations report
        Destination.keyed(report.report_key).delete_all
        direct_flights = DirectFlight.keyed(report.report_key).to_a
        cnx = []
        connections = []
        # Let's cache the results to limit DB Hits.
        cache = {}

        origins      = DirectFlight.keyed(report.report_key).pluck(:origin).uniq
        direct_pairs = DirectFlight.keyed(report.report_key).pluck(:origin, :dest)
        direct_pairs.sort!
        direct_pairs_hash = direct_pairs.group_by{|pair| pair[0]}

        origins.each do |o_apt|
          if cache.has_key? o_apt
            hub_apts = cache[o_apt].dup
          else
            hub_apts = direct_flights.select{|r| r.origin.eql? o_apt}.map{|r| r.dest}.uniq
            cache[o_apt] =  hub_apts.dup
          end

          hub_apts.each do |hub|
            if cache.has_key? hub
              dest_apts = cache[hub].dup
            else
              dest_apts = direct_flights.select{|r| r.origin.eql? hub}.map{|r| r.dest}.uniq

              cache[hub] =  dest_apts.dup
            end

            dest_apts.delete_if{|apt| apt.eql? o_apt}
            dest_apts.each do |dest|
              cnx << [o_apt,hub,dest] unless o_apt.eql? dest
            end
          end
        end
        Rails.logger.info "Unique Connection Pairs not filtered for Direct Flight Exclusion rule #{cnx.count}"
        cnx.delete_if{|row| direct_pairs_hash[row[0]].include? [row[0],row[2]] }
        Rails.logger.info "Unique Connection Pairs after filtered for Direct Flight Exclusion rule #{cnx.count}"
        tot = cnx.count
        cnx.in_groups_of(1000) do |cnx_group|
          puts "Building #{cnx_group.count} connections out of #{tot} remaining"
          tot -= 1000
          cnx_group.compact.each do |row|
           o_name = Airport.cached_name(row[0])
           h_name = Airport.cached_name(row[1])
           d_name = Airport.cached_name(row[2])
           connections << Destination.new(report_key: report.report_key, origin: o_name, origin_code: row[0],
                                          hub_name: h_name, hub_code: row[1], dest: d_name,dest_code: row[2]

           )
          end
          Destination.import connections
          connections = []
        end
        report.report_status = 'destinations_refreshed'
        report.save
    end

    def refresh_cnx_pairs(report)
          pairs = []
          connections = []
          CnxPair.keyed(report.report_key).delete_all

          pairs =  Destination.keyed(report.report_key).pluck(:origin_code, :dest_code).uniq
          tot = pairs.count
          pairs.in_groups_of(1000) do |pair_group|
            puts "Building #{pair_group.count} connection pairs out of #{tot} remaining"
            tot -= 1000
            pair_group.compact.each do |pair|
               o_name =  Airport.cached_name(pair[0])
               d_name = Airport.cached_name(pair[1])
               connections << CnxPair.new(report_key: report.report_key, origin: pair[0], origin_name: o_name, dest: pair[1], dest_name: d_name)
            end
            CnxPair.import connections
            connections = []
          end
          report.report_status = 'connections_refreshed'
          report.save

    end
    #TODO provide the option to store the processed files in the processed folder
    def finalize report
        puts "Finalizing #{report.attachment_path} import"

        File.delete report.attachment_path
        File.delete report.report_path
        Mastiff::Email.finalize([report.msg_id])
        report.load_status["attachment_status"] = 'processed'
        report.report_status                    = 'finished'
        report.save
    end

    def import_oag_file report
        begin
          importer = Oag::Import.new
          importer.parse_and_load_report report
          report.report_status = 'schedules_loaded'
          report.save
        rescue Exception => ex
               Rails.logger.info ex.message
               Rails.logger.info report.inspect
        end


    end


  end
end
