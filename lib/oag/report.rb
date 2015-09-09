require 'benchmark'
module Oag
  class Report




    def log_debug_string(brand, origin_code, index, origins, via_code, via_index, via_points)
        Rails.logger.info "(#{brand.brand_key}) Building branded connections  " +
                        "for #{origin_code} #{index + 1} of (#{origins.count}) through #{via_code}  " +
                        " #{via_index + 1} of (#{via_points.count})  - #{brand.brand_key}"
    end

    def build_brand_connections(brand)

      Rails.logger.info "Building Branded Connections for Schedules from Brand #{brand.brand_key} #{brand.name}"
      filtered_cxrs = []
      brand.data_states['branded_connections'] = {'state': 'processing'}
      brand.save

      # CURRENTLY DOES NOT SUPPORT EMBEDDED SEGMENTS, AS THE SCHEDULE MODEL DOESN'T KNOW THE VIA POINT
      # AND FURTHER MORE YOU CAN End Up with Circle Trip Flights like TR 2771
      origins = OagSchedule.branded(brand).for_cxrs(filtered_cxrs).stops(0)
                           .pluck(:origin_apt)
                           .sort.uniq



      routes = []
      brand_connections = []

      origins.each_with_index do |origin_code, index|

        via_points =
            OagSchedule.branded(brand).for_cxrs(filtered_cxrs)
                .departing(origin_code).stops(0)
                .pluck(:dest_apt).sort.uniq


        # via_points.each_with_index do |via_code, via_index|
        routes_for_origin = Parallel.map_with_index(via_points, in_threads:4) do |via_code, via_index|


           log_debug_string(brand, origin_code, index, origins, via_code, via_index, via_points)

           leg1_scheds = OagSchedule.branded(brand).for_cxrs(filtered_cxrs)
                                    .departing(origin_code)
                                    .arriving(via_code).stops(0)

           leg2_scheds = OagSchedule.branded(brand).for_cxrs(filtered_cxrs)
                                    .departing(via_code).stops(0)
                                    .reject{|sched| sched.dest_apt == origin_code}

           possible_routes = []

            leg1_scheds.each do |sched1|
              leg2_scheds.each do |sched2|
                window    = sched1.effective_window(sched2)
                op_window = sched1.connection_days_of_week(sched2,2)
                if not window.blank? and not op_window.blank?
                  possible_routes <<  BrandConnection.new(brand: brand,
                            origin: origin_code, via: via_code, dest: sched2.dest_apt,
                            sched1_cxr: sched1.airline_code, sched2_cxr: sched2.airline_code,
                            sched1_id: sched1.id,
                            sched1_eff_dates: sched1.effective_dates,
                            sched1_operating: sched1.arr_op_days,
                            sched2_id: sched2.id,
                            sched2_eff_dates: sched2.effective_dates,
                            sched2_operating: sched2.dep_op_days,
                            eff: window[:eff].to_date,
                            disc: window[:disc].to_date,
                            operating_window: op_window )

                end
              end
            end
           # possible_routes.uniq!{|route| [route.dest, route.eff_window, route.operating_window]  }
           possible_routes

        end
        routes = routes + routes_for_origin.compact.flatten(1)
      end
      routes = routes.compact.flatten

      group_size = 5000
      total_branded_connections = routes.count
      tot = routes.count


      BrandConnection.branded(brand).delete_all

      routes.in_groups_of(group_size) do |connection_group|

          BrandConnection.import connection_group.compact
          Rails.logger.info "Saving brand connections #{connection_group.compact.count} " +
                            " of #{tot} remaining for #{brand.brand_key}"
          tot = tot - connection_group.compact.count
      end

      brand.data_states['branded_connections'] = {'state': 'idle', 'count': total_branded_connections, 'updated_at': Time.now}
      brand.save



    end






   def direct_market_routes(brand, origin, dest)
     #  No Stops

      direct_route_requests = []
      direct_flight_markets = DirectFlight.pair(origin ,dest).keyed(brand.report_keys)
                                  # .compact

      direct_flight_markets.each do |df|
        hosts = brand.hosts_for(df.carriers).uniq
        # direct_host_templates = df.carriers.map{|cxr| {cxr: cxr, hosts: brand.hosts_for(df.carriers)}}.uniq
        # dht_by_host = direct_host_templates.group_by{|ht| ht[:host]}

        # dht_by_host.each do |host, cxr_host_list |
        hosts.each do |host|
          carriers = host.carrier_codes & df.carriers

          brr = BrandedRouteRequest.where( brand: brand, origin: origin, dest: dest,
                                           host: host.code, cxrs: carriers  ).first_or_create!

          bmr = BrandedMarketRequest.joins(:branded_route_requests)
                    .where(BrandedRouteRequest[:id].in [brr.id])
                    .where(brand: brand, origin: origin, dest: dest)
                    .first_or_create!

          # What is this doing?  Are we keeping the values uniq?  If so this may not be the way to do it.
          bmr.branded_route_requests << brr if  bmr.branded_route_requests.blank?

          direct_route_requests << bmr


        end
      end
      direct_route_requests
   end

   def one_stop_market_routes(brand, origin, dest)

     #  1 Stops
      mkt_connections = BrandConnection.branded(brand).market(origin,dest)

      routes =  mkt_connections.to_a.uniq{|c| c.key}

      routes_requests = []
      routes.each do |c|
        routes_requests =  routes_requests + c.to_route_requests
      end

      grouped_rrs = routes_requests.group_by{|mkt_rr| mkt_rr.map{|rr| rr.host_market_key}}

      grouped_rrs.each do |keys, group|
           brr0 =
           BrandedRouteRequest.where(
           group.first[0].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
               .merge(cxrs: group.map{|rr_list| rr_list[0].cxrs}
               .flatten.sort.uniq)
           ).first_or_create!
           brr1 =
           BrandedRouteRequest.where(
           group.first[1].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
               .merge(cxrs: group.map{|rr_list| rr_list[1].cxrs}
               .flatten.sort.uniq)
           ).first_or_create!

           bmr = BrandedMarketRequest.joins(:branded_route_requests)
                     .where(BrandedRouteRequest[:id].in [brr0.id, brr1.id])
                     .where(brand: brand, origin: origin, dest: dest)
                     .first_or_create!

           bmr.branded_route_requests << [brr0,brr1] if  bmr.branded_route_requests.blank?

           grouped_rrs[keys] = bmr

      end
      mkt_route_requests = grouped_rrs.values

      through_requests = mkt_route_requests.map{|bmr| bmr.through_market_request}.compact
      market_route_map = mkt_route_requests + through_requests

      market_route_map.compact
   end

   def two_stop_routes(brand)

       #  2 Stops
       markets = []

       one_seg_markets = DirectFlight.keyed(brand.report_keys).pluck(:origin, :dest).uniq
       two_seg_markets = BrandConnection.branded(brand).pluck(:origin, :dest).sort.uniq

       Rails.logger.info "(#{brand.brand_key}) There are  #{one_seg_markets.count} one segment markets"
       Rails.logger.info "(#{brand.brand_key}) There are  #{two_seg_markets.count} two segment markets"

       existing_markets = one_seg_markets | two_seg_markets
       Rails.logger.info "(#{brand.brand_key}) There are  #{existing_markets.count} combined one/two segment markets"

       three_segment_mkt_connects = Hash.new([])



       existing_markets.each_with_index do |e_mkt, emkt_index|
         e_origin, e_dest = e_mkt


         bc_list = BrandConnection.branded(brand).market(e_origin, e_dest)
         if bc_list.count == 0
           Rails.logger.info "(#{brand.brand_key}) Building connections - Skip  #{e_origin} #{e_dest} for #{emkt_index} of (#{existing_markets.count}) one/two seg markets, no connections exist"
         else
            Rails.logger.info "(#{brand.brand_key}) Building connections  #{e_origin} #{e_dest} for #{emkt_index} of (#{existing_markets.count}) one/two seg markets"
         end


         three_segment_arrays = Parallel.map_with_index(bc_list, in_threads:12) do |bc, bc_index|
           results_arr = []


           Rails.logger.info " ==== (#{brand.brand_key}) Building Three Seg connects from #{bc.origin} #{bc.via} #{bc.dest} " +
                                 " id:#{bc.id} #{bc_index} of (#{bc_list.count}) - #{emkt_index} of (#{existing_markets.count}) markets "
           origin = bc.origin



           connecting_bcs = BrandConnection.connecting_scheds(bc)

           destinations = connecting_bcs.pluck(:dest).sort.uniq
           destinations.each_with_index do |dest, index|

             mkt = "#{origin}-#{dest}"
             Rails.logger.info " ==== (#{brand.brand_key}) Building Three Segment mkt requests  for #{mkt}  "  +
                               "  #{index} of (#{destinations.count}) #{emkt_index} of (#{existing_markets.count})"


             markets = markets | [[origin, dest]]


             c1 = ConnRef.new(id: bc.id, key: bc.key)
             cb_list = connecting_bcs.select{|cbc| cbc.dest == dest}
             uniq_cb_list = cb_list.map{|other| ConnRef.new(id: other.id, key: other.key)}.uniq{|cr| cr.key}

             multi_connections = uniq_cb_list.map{|c2| MultiConnRef.new(conns: [c1,c2])}.uniq{|mc| mc.key}
             results_arr << [mkt,  multi_connections]

           end
           results_arr

         end
         three_segment_arrays = three_segment_arrays.flatten(1)
         three_segment_arrays.each do |mkt, multi_connections|
           three_segment_mkt_connects[mkt] = multi_connections
         end

       end
       # pp  three_segment_mkt_connects.keys.map{|k| [k,three_segment_mkt_connects[k].count]}
       brand_market_reqs = Hash.new([])

       three_segment_mkt_connects.each do |mkt, mkt_conns|
         origin, dest = mkt.split('-')
         mkt_connections = []

         mkt_conns.each do |mcr|
           bcs = mcr.conns.map{|c| BrandConnection.find(c.id)}
           rrs = bcs.map{|c| c.to_route_requests}.flatten.uniq
           rr_ids = rrs.map{|rr| rr.id}

           bmr = BrandedMarketRequest.joins(:branded_route_requests)
                       .where(BrandedRouteRequest[:id].in rr_ids)
                       .where(brand: brand,
                              origin: origin, dest: dest).first_or_create!

           bmr.branded_route_requests << rrs if  bmr.branded_route_requests.blank?
           mkt_connections << bmr

         end

         # TODO:  Generate Through Requests
         
         unless  mkt_connections.blank?
            BrandedMarketSegmentsRequest.create(brand: brand,
                           origin: origin, dest:dest, segment_count: 3,
                           branded_market_request_ids: mkt_connections.map{|bmr| bmr.id} )
         end

       end
    end



   def build_brand_market_routes(brand, segment_count)
       BrandedMarketSegmentsRequest.branded(brand)
                                   .where(segment_count: segment_count).destroy_all

       market_requests = []
       case segment_count
         when 1
           one_segment_markets = DirectFlight.keyed(brand.report_keys).pluck(:origin, :dest).uniq
           one_segment_markets.each_with_index do |pair, index|
             origin, dest = pair
             Rails.logger.info " ==== (#{brand.brand_key}) Building One Segment mkt requests  for #{origin} #{dest} "
             Rails.logger.info " ==== (#{brand.brand_key}) Building #{index} of (#{one_segment_markets.count}) "


             market_requests = direct_market_routes(brand, origin, dest)

             unless  market_requests.blank?
                    BrandedMarketSegmentsRequest.create(brand: brand, origin: origin, dest:dest,
                                   segment_count: segment_count,
                                   branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
             end
           end
           # market_requests = direct_market_routes(brand, origin, dest)
         when 2
           two_segment_markets = BrandConnection.branded(brand).pluck(:origin, :dest).sort.uniq
           two_segment_markets.each_with_index do |market, index|

             origin, dest = market

             Rails.logger.info " ==== (#{brand.brand_key}) Building Two Segment mkt requests  for #{origin} #{dest} "
             Rails.logger.info " ==== (#{brand.brand_key}) Building #{index} of (#{two_segment_markets.count}) "

             market_requests = one_stop_market_routes(brand, origin, dest)


             unless  market_requests.blank?
               BrandedMarketSegmentsRequest.create(brand: brand,
                                                 origin: origin, dest:dest, segment_count: segment_count,
                                                 branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
             end
           end

         when 3
           market_requests = two_stop_routes(brand)
         else
           "Bad Case"

       end

       # unless  market_requests.blank?
       # BrandedMarketSegmentsRequest.create(brand: brand,
       #                origin: origin, dest:dest, segment_count: segment_count,
       #                branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
       # end


   end

    def build_brand_market_smart_routes(brand, seg_counts)

      brand.data_states['smart_routes'] = {'state': 'processing'}
      brand.save

      seg_counts.each do |seg_count|
        BrandedMarketSegmentsRequest.branded(brand).with_segs(seg_count).delete_all
        # BrandedRouteRequest.branded(brand).destroy_all
        # BrandedMarketRequest.branded(brand).destroy_all



        build_brand_market_routes(brand, seg_count)

      end
      counts_array = BrandedMarketSegmentsRequest.branded(brand).pluck('DISTINCT segment_count')
      counts_array.map!{ |c| { segs: c, count: BrandedMarketSegmentsRequest.branded(brand).with_segs(c).count} }
      brand.data_states['smart_routes'] = {'state': 'idle', 'count': counts_array, 'updated_at': Time.now}
      brand.save


    end


    def market_route_map(brand, origin, dest, seg_counts)
          requests = []
          seg_counts.each do |seg_count|
                bmr =   BrandedMarketSegmentsRequest.branded(brand)
                        .market(origin, dest)
                        .where(segment_count: seg_count).first


                requests = (requests + bmr.branded_market_requests) if bmr and not bmr.branded_market_requests.blank?

          end

          requests.uniq
          requests
    end


    def build_brand_route_maps(brand, seg_counts)
      
      brand.data_states['route_maps'] = {'state': 'processing'}
      brand.save

      markets = BrandedMarketSegmentsRequest.branded(brand).pluck(:origin, :dest).sort.uniq

      market_maps = {}

      markets.each_with_index do |mkt,mkt_index|

        origin, dest = mkt
        mkt_key = "#{origin}-#{dest}"
        Rails.logger.info "(#{brand.brand_key}) Building routemap for market  #{mkt_key} #{mkt_index} of (#{markets.count})"

        mkt_requests        = market_route_map(brand, origin, dest, seg_counts)
        reverse_mkt_request = market_route_map(brand, dest, origin, seg_counts)
        return_mkt_request = mkt_requests.product reverse_mkt_request

        one_way = []
        mkt_requests.each do |mkt_request|
               one_way <<
               {
               	type: 'oneway',
                   journeys: [
                       mkt_request.to_journey(1, 'outbound')
                   ]
               }
        end

        roundtrip = []

        return_mkt_request.each do |return_mkt_req|
          roundtrip <<
              {
                type: 'return',
                   journeys: [
                       return_mkt_req[0].to_journey(1, 'outbound'),
                       return_mkt_req[1].to_journey(2, 'inbound')
                   ]
              }
        end
        market_map = {
            "#{mkt_key}" => {
                oneway: one_way,
                roundtrip: roundtrip
        }}
        market_maps.merge! market_map

      end
      branded_route_map = BrandedRouteMap.where(brand: brand).first_or_create!
      branded_route_map.route_map = market_maps
      branded_route_map.save

      brand.data_states['route_maps'] = {'state': 'idle',  'updated_at': Time.now, 'markets': market_maps.keys.count}
      brand.save


    end

    def brand_route_map_document(brand)
      brm = BrandedRouteMap.branded(brand)
      JSON.pretty_generate(brm.route_map)
    end

    def export_brand_route_maps(brand)
      File.open("#{brand.brand_key.downcase}_route_map.json", 'w') {|f| f.write(
              brand_route_map_document(brand)
            )
      }
    end


  #End Class
  end
end


      # grouped_rrs = routes_requests.group_by{|mkt_rr| mkt_rr.map{|rr| rr.host_market_key}}
      # grouped_rrs.each do |keys, group|
      #   leg1_cxrs = group.map{|rr_list| rr_list[0].cxrs}.flatten
      #   leg2_cxrs = group.map{|rr_list| rr_list[1].cxrs}.flatten
      #   group[0][0].cxrs = leg1_cxrs
      #   group[0][1].cxrs = leg1_cxrs
      #
      # end
