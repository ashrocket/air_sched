require 'thread'
require 'mastiff'

module Oag
  class Process


    def filter_destinations(report)

      dests = Destination.keyed(report.report_key)

      group_size = 1000
      tot = dests.count
      dests.in_groups_of(group_size) do |dest_group|

        dest_group.compact.each do  |dest|

        leg1_scheds = OagSchedule.keyed(report.report_key).departing(dest.origin_code).arriving(dest.hub_code)
        leg2_scheds  = OagSchedule.keyed(report.report_key).departing(dest.hub_code).arriving(dest.dest_code)

             overlapping_scheds = []

             leg1_scheds.each do |sched1|
               leg2_scheds.each do |sched2|
                  if sched1.effective_overlaps? sched2
                    overlapping_scheds << {scheds: [sched1, sched2], window: sched1.effective_window(sched2) }
                  end

               end

             end
             connected_schedules = []
             overlapping_scheds.each do  |sched_set|
               connected_departure_days = sched_set[:scheds][0].connection_days_of_week(sched_set[:scheds][1],2)
               if not connected_departure_days.empty?
                 sched_set[:cnx_dep_days] = connected_departure_days
                 connected_schedules << sched_set
               end
             end

             eff_days = connected_schedules.map{ |cs|  [ cs[:window][:eff].to_date,
                                                               cs[:window][:disc].to_date,
                                                               cs[:cnx_dep_days]].to_json
                                                      }
             dest.eff_days = eff_days
             dest.save

        end
        Rails.logger.info "Filtering #{dest_group.compact.count} destinations from #{tot} remaining for #{report.report_key}"
        tot = tot - dest_group.compact.count
      end

      report.load_status[:destinations_map_status] = 'eff_days_filtered'
      report.save

    end

    def refresh_airports(report)
        origins = []
        destinations = []

        origins      += OagSchedule.origins(report)
        destinations += OagSchedule.destinations(report)
        airports = (origins + destinations).uniq
        airports.each do |airport|
           apt = Airport.where(code: airport[0]).first_or_create!
           apt.name = airport[1]
           apt.city = airport[2]
           apt.save
        end
        report.report_status = 'airports_refreshed'
        report.save
    end

    def refresh_airlines(report)
        report.carriers = OagSchedule.carriers_details_for_report(report)

        # TODO Refresh Global Airline Table
        # Set Carrier to Active
        # Refactor Airline Carrier relationship to be a has_one with an active flag
        # The Airlines Table will likey need to include duplicates and be loaded
        # seperately from OAG as the list of airlines
        #

        report.report_status = 'airlines_refreshed'
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

      report.load_status[:destinations_map_status] = 'initialized'

        Destination.keyed(report.report_key).delete_all

        direct_flights = DirectFlight.keyed(report.report_key).to_a
        cnx = []
        connections = []
        # Let's cache the results to limit DB Hits.
        cache = {}
        origins      = DirectFlight.keyed(report.report_key).pluck(:origin).uniq
        direct_pairs = DirectFlight.keyed(report.report_key).pluck(:origin, :dest, :carriers)
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
              df1 =  DirectFlight.keyed(report.report_key).where(origin: o_apt, dest: hub).first
              cxrs1 =  df1.blank? ? [""] : df1.carriers.uniq
              df2 =  DirectFlight.keyed(report.report_key).where(origin: hub, dest: dest).first
              cxrs2 =  df2.blank? ? [""] : df2.carriers.uniq

              cnx << [o_apt,hub,dest, cxrs1, cxrs2] unless o_apt.eql? dest
            end
          end
        end

        tot = cnx.count
        cnx.in_groups_of(1000) do |cnx_group|
          Rails.logger.info "Building #{cnx_group.count} destination connections out of #{tot} remaining for #{report.report_key}"
          tot -= 1000
          cnx_group.compact.each do |row|
           o_name = Airport.cached_name(row[0])
           h_name = Airport.cached_name(row[1])
           d_name = Airport.cached_name(row[2])
           connections << Destination.new(report_key: report.report_key, origin: o_name, origin_code: row[0],
                                          hub_name: h_name, hub_code: row[1], dest: d_name,dest_code: row[2],
                                          cxrs1: row[3], cxrs2: row[4], eff_days: row[5]
           )
          end

          rules = InterlineCxrRule.keyed(report.report_key)
          unless rules.blank?
            rules.sort_by(&:sequence).each do |rule|
              connections = rule.apply(connections)
            end
          end
          Destination.import connections
          connections = []
        end
      report.load_status[:destinations_map_status] = 'refreshed'
      report.report_status = 'destinations_refreshed'
      report.save
    end







    def refresh_cnx_pairs(report)
          pairs = []
          connections = []
          CnxPair.keyed(report.report_key).delete_all

          pairs =  Destination.keyed(report.report_key).pluck(:origin_code, :dest_code).uniq
          tot = pairs.count
          group_size = 1000
          pairs.in_groups_of(group_size) do |pair_group|
            Rails.logger.info "Building #{pair_group.count} connection pairs out of #{tot} remaining #{report.report_key}"
            tot -= group_size
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
    def finalize report, status
        Rails.logger.info "Finalizing #{report.attachment_path} import"

        File.delete report.attachment_path if File.exist?(report.attachment_path)
        File.delete report.report_path if File.exist?(report.report_path)
        Mastiff::Email.finalize([report.msg_id], status)
        report.load_status['attachment_status'] = status
        report.report_status                    = 'finished'
        report.complete = true
        report.save
    end
    def large_import(report)
      line_count = %x{wc -l < "#{report.load_status['report_path']}"}.to_i
      line_count > 10000
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
    def import_large_oag_file report
        begin
          importer = Oag::Import.new
          importer.parse_and_load_large_report report

        rescue Exception => ex
               Rails.logger.info ex.message
               Rails.logger.info report.inspect
        end
    end





  end
end
