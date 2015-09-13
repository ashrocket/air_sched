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
                    .where(brand: brand, origin: origin, dest: dest, seg_count: 1)
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
           brr1 =
           BrandedRouteRequest.where(
           group.first[0].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
               .merge(cxrs: group.map{|rr_list| rr_list[0].cxrs}
               .flatten.sort.uniq)
           ).first_or_create!
           brr2 =
           BrandedRouteRequest.where(
           group.first[1].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
               .merge(cxrs: group.map{|rr_list| rr_list[1].cxrs}
               .flatten.sort.uniq)
           ).first_or_create!

           bmrrs_intersection = brr1.branded_market_requests.where(seg_count: 2) & brr2.branded_market_requests.where(seg_count: 2)

           if bmrrs_intersection.count > 1
             raise("There should only be 1 Branded Market Request for brr1_id #{brr1.id} brr2_id #{brr2.id}")
           end

           if bmrrs_intersection.blank?
            bmr =  BrandedMarketRequest.create(brand: brand, origin: origin, dest: dest, seg_count: 2)
            bmr.branded_route_requests << [brr1,brr2]
            bmr.save

           else
             bmr = bmrrs_intersection.first

           end



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



        conn_pairs = Hash.new { |h, k| h[k] = Set.new }
        branded_connections = BrandConnection.branded(brand)
        total = branded_connections.count
        Parallel.each_with_index(branded_connections, in_threads:6) do |bc, idx|
        # branded_connections.each_with_index do |bc, idx|

          bc_list = BrandConnection.branded(brand).connecting_brand_connections(bc)
          unless bc_list.blank?

            Rails.logger.info "(#{brand.brand_key}) Checking Connections on connection  #{idx} of #{total} posible branded connections"
            #  Merge any list for duplicate key
            conn_pairs[bc.route_cxrs_hash_key].merge  bc_list
          else
            Rails.logger.info "(#{brand.brand_key}) Skipping Connections (No connection)  #{idx} of #{total} posible branded connections"

          end
        end
        Rails.logger.info "(#{brand.brand_key}) Connections with Possible Connections =  #{conn_pairs.keys.count} "




        by_markets = Hash.new { |h, k| h[k] = Set.new }
        #Now convert the connections into raw params needed for Route Request.
        conn_pairs.keys.each_with_index do |uniq_conn_route_key, idx|

            branded_route_templates = conn_pairs[uniq_conn_route_key].map{|bc| bc.route_cxrs_hash_key}.uniq
            origin = uniq_conn_route_key[:o]

            branded_route_templates.each do |brt|
               by_markets[[origin,brt[:d]]] << [uniq_conn_route_key,brt]
            end


         end



        hostcodes = brand.hostcodes_map

        total_markets = by_markets.keys.count
        three_seg_branded_market_requests = Hash.new { |h, k| h[k] = Set.new }
        # Parallel.map_with_index(by_markets.keys, in_threads:6) do |mkt, mkt_index|
        by_markets.keys.each_with_index do |mkt, mkt_index|
            Rails.logger.info "(#{brand.brand_key}) Build 3 Segment Routes for #{mkt}, #{mkt_index} of (#{total_markets}) "

            tsr_list = by_markets[mkt]
            tsr_list.each do |tsr|

              tsr_1 = tsr[0]
              tsr_2 = tsr[1]


              # Do the first  legs
              host_codes = hostcodes[tsr_1[:c1]]
              rr1_s = host_codes.map{ |host_code|
                    BrandedRouteRequest.where(brand: brand, origin: tsr_1[:o],  dest: tsr_1[:v],
                            cxrs: [tsr_1[:c1]], host: host_code).first_or_create!
                }
              host_codes = hostcodes[tsr_1[:c2]]
              rr2_s = host_codes.map{ |host_code|
                    BrandedRouteRequest.where(brand: brand, origin: tsr_1[:v],  dest: tsr_1[:d],
                            cxrs: [tsr_1[:c1]], host: host_code).first_or_create!
              }
              host_codes = hostcodes[tsr_2[:c2]]
              rr3_s = host_codes.map{ |host_code|
                    BrandedRouteRequest.where(brand: brand, origin: tsr_1[:v],  dest: tsr_1[:d],
                            cxrs: [tsr_1[:c1]], host: host_code).first_or_create!
              }
              rr1_s.uniq!
              rr2_s.uniq!
              rr3_s.uniq!

              combinations = (rr1_s.product rr2_s).uniq.product rr3_s
              host_rrs = combinations.map{|j| j[0] +[ j[1]]}

              host_rrs.each do |rrs|
                  all_branded_market_requests = rrs.map{|rr| rr.branded_market_requests.where(seg_count: 3)}
                  bmrrs_intersection = all_branded_market_requests.inject(:&)



                  raise("There should only be 1 Branded Market Request for brrs #{rrs.map{|rr| rr.id}}") if bmrrs_intersection.count > 1


                  if bmrrs_intersection.blank?
                    bmr =  BrandedMarketRequest.create(brand: brand, origin: tsr_1[:o], dest: tsr_2[:d], seg_count: 3)
                    bmr.branded_route_requests << rrs
                    bmr.save

                  else
                    bmr = bmrrs_intersection.first
                  end

                  three_seg_branded_market_requests[mkt] << bmr

              end
            end

        end


        total_three_seg_markets =  three_seg_branded_market_requests.keys.count
        three_seg_branded_market_requests.keys.each_with_index do |k, three_seg_mkt_idx|

          Rails.logger.info "(#{brand.brand_key}) Saving 3 Segment Routes for #{k.first}-#{k.last}, #{three_seg_mkt_idx} of (#{total_three_seg_markets}) "
          bmr_set = three_seg_branded_market_requests[k]
          BrandedMarketSegmentsRequest.create(brand: brand,
                    origin: k.first, dest:k.last, segment_count: 3,
                    branded_market_request_ids: bmr_set.map{|bmr| bmr.id} )
        end



    end



   def build_brand_market_routes(brand, segment_count)
       BrandedMarketSegmentsRequest.branded(brand)
                                   .where(segment_count: segment_count).destroy_all

       market_requests = []
       case segment_count
         when 1
           BrandedMarketRequest.destroy_all(brand: brand, seg_count: 1)

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
           BrandedMarketRequest.destroy_all(brand: brand, seg_count: 2)

           two_segment_markets = BrandConnection.branded(brand).pluck(:origin, :dest).sort.uniq


           Parallel.each_with_index(two_segment_markets, in_threads: 8) do |market, index|
           # two_segment_markets.each_with_index do |market, index|

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
           BrandedMarketRequest.destroy_all(brand: brand, seg_count: 3)

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
        BrandedMarketSegmentsRequest.branded(brand).with_segs(seg_count).destroy_all
        # BrandedRouteRequest.branded(brand).destroy_all
        # BrandedMarketRequest.branded(brand).destroy_all



        build_brand_market_routes(brand, seg_count)

      end
      counts_array = BrandedMarketSegmentsRequest.branded(brand).pluck('DISTINCT segment_count')
      counts_array.map!{ |c| { segs: c, count: BrandedMarketSegmentsRequest.branded(brand).with_segs(c).count} }
      brand.data_states['smart_routes'] = {'state': 'idle', 'count': counts_array, 'updated_at': Time.now}
      brand.save


    end



    def branded_market_route_map(brand, origin, dest, seg_counts)


      bmrm = BrandedMarketRouteMap.find_or_create_by(brand: brand, origin: origin, dest: dest)

      requests = []
      reverse_requests = []


      seg_counts.each do |seg_count|
            bmr =   BrandedMarketSegmentsRequest.branded(brand)
                    .market(origin, dest)
                    .where(segment_count: seg_count).first


            requests = (requests + bmr.branded_market_requests) if bmr and not bmr.branded_market_requests.blank?

      end

      requests.uniq!

      seg_counts.each do |seg_count|
            bmr =   BrandedMarketSegmentsRequest.branded(brand)
                    .market(dest, origin)
                    .where(segment_count: seg_count).first


            reverse_requests = (reverse_requests + bmr.branded_market_requests) if bmr and not bmr.branded_market_requests.blank?

      end

      reverse_requests.uniq!


      roundtrip_requests = requests.product reverse_requests

      one_way = []
      requests.each do |mkt_request|
        one_way <<
        {
          type: 'oneway',
            journeys: [
                mkt_request.to_journey(1, 'outbound')
            ]
        }
      end

      roundtrip = []

      roundtrip_requests.each do |roundtrip_req|
         roundtrip <<
             {
               type: 'return',
                  journeys: [
                      roundtrip_req[0].to_journey(1, 'outbound'),
                      roundtrip_req[1].to_journey(2, 'inbound')
                  ]
             }
      end

      bmrm.route_map = {
        oneway: one_way,
        # TODO:  Richard says he doens't want the RoundTrip Calculations.
        # This should be set to an switch on the Brand, but we need to make the APP SWITCH model capable of using
        # scopes.  AKA an APP SWITCH per Brand.  Then we can enable or disable via APP SWITCH, for now it's just
        # hard commented out.
        # roundtrip: roundtrip
        roundtrip: []
      }

      bmrm.save
      bmrm

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

      Parallel.each_with_index(markets, in_threads: 8) do |mkt,mkt_index|

      # markets.each_with_index do |mkt,mkt_index|

        origin, dest = mkt
        mkt_key = "#{origin}-#{dest}"
        Rails.logger.info "(#{brand.brand_key}) Building routemap for market  #{mkt_key} #{mkt_index} of (#{markets.count})"

        # if mkt_key.eql? "CNX-BFV"
        #      byebug
        # end

        bmrm = branded_market_route_map( brand, origin, dest, seg_counts)

        # mkt_requests        = market_route_map(brand, origin, dest, seg_counts)
        # reverse_mkt_request = market_route_map(brand, dest, origin, seg_counts)
        # return_mkt_request = mkt_requests.product reverse_mkt_request
        #
        # one_way = []
        # mkt_requests.each do |mkt_request|
        #        one_way <<
        #        {
        #        	type: 'oneway',
        #            journeys: [
        #                mkt_request.to_journey(1, 'outbound')
        #            ]
        #        }
        # end
        #
        # roundtrip = []
        #
        # return_mkt_request.each do |return_mkt_req|
        #   roundtrip <<
        #       {
        #         type: 'return',
        #            journeys: [
        #                return_mkt_req[0].to_journey(1, 'outbound'),
        #                return_mkt_req[1].to_journey(2, 'inbound')
        #            ]
        #       }
        # end
        # market_map = {
        #     "#{mkt_key}" => {
        #         oneway: one_way,
        #         roundtrip: roundtrip
        # }}


        #TODO:  Don't store the market route maps in the total route_map, instead store a reference to market_route map
        market_map = {"#{mkt_key}" => bmrm.route_map  }



        market_maps.merge! market_map

      end

      branded_route_map = BrandedRouteMap.where(brand: brand).first_or_create!
      #  Let's set an insert order for better JSON exprting
      sorted_hash = {}
      market_maps.keys.sort.each do |k,v|
        sorted_hash[k] = v
      end
      branded_route_map.route_map = sorted_hash
      branded_route_map.save

      brand.data_states['route_maps'] = {'state': 'idle',  'updated_at': Time.now, 'markets': market_maps.keys.count}
      brand.save


    end

    def brand_route_map_document(brand)
      brm = BrandedRouteMap.branded(brand)
      unless brm.blank?
        JSON.pretty_generate(brm.route_map)
      else
        JSON.pretty_generate({})
      end
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
