
module Oag
  class Report



    def build_brand_connections(brand)
      filtered_cxrs = ['TZ','DD', 'XW']
      BrandConnection.keyed(brand.brand_key).destroy_all

      origins = OagSchedule.branded(brand.report_keys).for_cxrs(filtered_cxrs)
                           .pluck(:origin_apt)
                           .sort.uniq

      routes = []
      brand_connections = []

      origins.each_with_index do |origin_code, index|

        via_points =
            OagSchedule.branded(brand.report_keys).for_cxrs(filtered_cxrs)
                .departing(origin_code)
                .pluck(:dest_apt).sort.uniq


        via_points.each_with_index do |via_code, via_index|
            Rails.logger.info "Building connections  " +
                  "for #{origin_code} #{index} of (#{origins.count}) through #{via_code}  " +
                  " #{via_index} of (#{via_points.count})  - #{brand.brand_key}"

           leg1_scheds = OagSchedule.branded(brand.report_keys).for_cxrs(filtered_cxrs)
                                    .departing(origin_code)
                                    .arriving(via_code)

           leg2_scheds = OagSchedule.branded(brand.report_keys).for_cxrs(filtered_cxrs)
                                    .departing(via_code)
                                    .reject{|sched| sched.dest_apt == origin_code}


            leg1_scheds.each do |sched1|
              possible_routes = []
              leg2_scheds.each do |sched2|
                window    = sched1.effective_window(sched2)
                op_window = sched1.connection_days_of_week(sched2,2)
                if not window.blank? and not op_window.blank?

                  possible_routes <<  BrandConnection.new(brand_id: brand.id, brand_key: brand.brand_key,
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
              # possible_routes.uniq!{|route| [route.dest, route.eff_window, route.operating_window]  }
              routes = routes + possible_routes
            end


           end


          # routes.map!{|route|  {
           #     sched1: route[0],
           #     sched2: route[1],
           #     windows: {
           #         sched1: {window: route[0].effective_dates, operating: route[0].arr_op_days},
           #         sched2: {window: route[1].effective_dates, operating: route[1].dep_op_days},
           #         route:  {window:  route.first.effective_window(route.last),
           #                 operating: route.first.connection_days_of_week(route.last,2)}
           #
           #      }}
           #
           # }

           # routes = routes.delete_if{ |route| route[:windows][:route][:window].blank? || route[:windows][:route][:operating].blank? }
           # routes.each do |route|

             # brand_connections <<
                 # BrandConnection.new(brand_key: brand.brand_key,
                 #                      origin: origin_code,  dest: route[:sched2].dest_apt, via: dest_code,
                 #                      sched1_id:      route[:sched1].id,
                 #                                    sched1_eff_dates
                 #                                             t.json :sched1_operating
                 #                                             t.json :sched2_eff_dates
                 #                                             t.json :sched2_operating
                 #                                             t.json :ct_minutes
                 #                                             t.json :eff_window
                 #                                             t.json :operating_window
                 #
                 #
                 #
                 #                                       sched2_id: route[:sched2].id,
                 #                      eff_window: route[:windows])
           # brand_route_maps << BrandRouteMap.new(brand_key: brand.brand_key,
           #                                                 origin: origin_code, dest: dest_code,
           #                                                 segments: 2,
           #                                                 route_map: routes)

        end

      group_size = 5000
      tot = routes.count
      routes.in_groups_of(group_size) do |connection_group|

          BrandConnection.import connection_group.compact
          Rails.logger.info "Saving brand connections #{connection_group.compact.count} " +
                            " of #{tot} remaining for #{brand.brand_key}"
          tot = tot - connection_group.compact.count
      end

      # BrandRouteMap.import brand_route_maps



    end






   def direct_market_routes(brand, origin, dest)
     #  No Stops

      direct_route_requests = []
      direct_flight_markets = DirectFlight.pair(origin ,dest).multi_keyed(brand.report_keys).compact

      direct_flight_markets.each do |df|
        direct_host_templates = df.carriers.map{|cxr| {cxr: cxr, host: brand.host_map[cxr]}}.uniq
        dht_by_host = direct_host_templates.group_by{|ht| ht[:host]}
        dht_by_host.each do |host, cxr_host_list |

          carriers = cxr_host_list.map{|cxr_host| cxr_host[:cxr]}.sort


          # if origin == 'DMK' and dest == 'SIN' and cxrs = ['TZ','XW']
          # # (TZ:ScootHost/DMK-SIN-TZ,XW)
          #   byebug
          #   "STOP"
          # end

          brr = BrandedRouteRequest.where( brand_id: brand.id, brand_key: brand.brand_key,
                           origin: origin,  dest: dest,  host: host, cxrs: carriers
                           ).first_or_create!
          bmr = BrandedMarketRequest.joins(:branded_route_requests)
                    .where(BrandedRouteRequest[:id].in [brr.id])
                    .where(brand_key: brand.brand_key, brand_id: brand.id,
                           origin: origin, dest: dest).first_or_create!

          bmr.branded_route_requests << brr if  bmr.branded_route_requests.blank?

          direct_route_requests << bmr


        end
      end
      direct_route_requests
   end

   def one_stop_market_routes(brand, origin, dest)

     #  1 Stops
      mkt_connections = BrandConnection.keyed(brand.brand_key).market(origin,dest)

      routes =  mkt_connections.to_a.uniq{|c| c.key}

      routes_requests = routes.map{|c| c.to_route_requests}

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
                     .where(brand_key: brand.brand_key, brand_id: brand.id,
                            origin: origin, dest: dest).first_or_create!

           bmr.branded_route_requests << [brr0,brr1] if  bmr.branded_route_requests.blank?

           grouped_rrs[keys] = bmr

      end
      mkt_route_requests = grouped_rrs.values

      through_requests = mkt_route_requests.map{|bmr| bmr.through_market_request}.compact
      market_route_map = mkt_route_requests + through_requests

      market_route_map.compact
   end

   def two_stop_routes(brand)

       #  1 Stops
       markets = []

       one_seg_markets = DirectFlight.multi_keyed(brand.report_keys).pluck(:origin, :dest).uniq
       two_seg_markets = BrandConnection.keyed(brand.brand_key).pluck(:origin, :dest).sort.uniq

       Rails.logger.info "(#{brand.brand_key}) There are  #{one_seg_markets.count} one segment markets"
       Rails.logger.info "(#{brand.brand_key}) There are  #{two_seg_markets.count} two segment markets"

       existing_markets = one_seg_markets | two_seg_markets
       Rails.logger.info "(#{brand.brand_key}) There are  #{existing_markets.count} combined one/two segment markets"

       three_segment_mkt_connects = Hash.new([])

       existing_markets.each_with_index do |e_mkt, index|
         e_origin, e_dest = e_mkt

         Rails.logger.info "(#{brand.brand_key}) Building connections  #{e_origin} #{e_dest} for #{index} of (#{existing_markets.count}) one/two seg markets"

         BrandConnection.keyed(brand.brand_key).market(e_origin, e_dest).each do |bc|
         # bc_list.each do |bc|
           origin = bc.origin
           connecting_bcs = bc.connects_with.to_a
           destinations = connecting_bcs.pluck(:dest).sort.uniq
           destinations.each do |dest|
             mkt = "#{origin}-#{dest}"
             markets = markets | [[origin, dest]]


             c1 = ConnRef.new(id: bc.id, key: bc.key)
             cb_list = connecting_bcs.select{|cbc| cbc.dest == dest}
             uniq_cb_list = cb_list.map{|other| ConnRef.new(id: other.id, key: other.key)}.uniq{|cr| cr.key}

             multi_connections = uniq_cb_list.map{|c2| MultiConnRef.new(conns: [c1,c2])}.uniq{|mc| mc.key}
             three_segment_mkt_connects[mkt] = multi_connections
           end
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
                       .where(brand_key: brand.brand_key, brand_id: brand.id,
                              origin: origin, dest: dest).first_or_create!

           bmr.branded_route_requests << rrs if  bmr.branded_route_requests.blank?
           mkt_connections << bmr

         end

         # TODO:  Generate Through Requests
         
         unless  mkt_connections.blank?
            BrandedMarketSegmentsRequest.create(brand_id: brand.id, brand_key: brand.brand_key,
                           origin: origin, dest:dest, segment_count: 3,
                           branded_market_request_ids: mkt_connections.map{|bmr| bmr.id} )
         end

       end
    end



   def build_brand_market_routes(brand, segment_count)
       BrandedMarketSegmentsRequest.branded(brand)
                                   .where(segment_count: segment_count)
                                    .destroy_all

       market_requests = []
       case segment_count
         when 1
           one_segment_markets = DirectFlight.multi_keyed(brand.report_keys).pluck(:origin, :dest).uniq
           one_segment_markets.each do |origin, dest|
             market_requests = direct_market_routes(brand, origin, dest)

             unless  market_requests.blank?
                    BrandedMarketSegmentsRequest.create(brand_id: brand.id, brand_key: brand.brand_key,
                                   origin: origin, dest:dest, segment_count: segment_count,
                                   branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
             end
           end
           # market_requests = direct_market_routes(brand, origin, dest)
         when 2
           two_segment_markets = BrandConnection.keyed(brand.brand_key).pluck(:origin, :dest).sort.uniq
           two_segment_markets.each_with_index do |market, index|

             origin, dest = market

             Rails.logger.info " ==== (#{brand.brand_key}) Building 2 Segment mkt requests  for #{origin} #{dest} "
             Rails.logger.info " ==== (#{brand.brand_key}) Building #{index} of (#{two_segment_markets.count}) "

             market_requests = one_stop_market_routes(brand, origin, dest)


             unless  market_requests.blank?
               BrandedMarketSegmentsRequest.create(brand_id: brand.id, brand_key: brand.brand_key,
                                                 origin: origin, dest:dest, segment_count: segment_count,
                                                 branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
             end
           end

         when 3
           market_requests = two_stop_routes(brand)
         else
           byebug
           "Bad Case"

       end

       # unless  market_requests.blank?
       # BrandedMarketSegmentsRequest.create(brand_id: brand.id, brand_key: brand.brand_key,
       #                origin: origin, dest:dest, segment_count: segment_count,
       #                branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
       # end


   end

    def build_brand_market_smart_routes(brand)

      BrandedMarketSegmentsRequest.branded(brand).destroy_all
      BrandedRouteRequest.branded(brand).destroy_all
      BrandedMarketRequest.branded(brand).destroy_all


      build_brand_market_routes(brand, 1)

      build_brand_market_routes(brand, 2)

      build_brand_market_routes(brand, 3)



    end


    def market_route_map(brand, origin, dest)
          requests = []
          [*1..3].each do |seg_count|
                bmr =   BrandedMarketSegmentsRequest.branded(brand)
                        .market(origin, dest)
                        .where(segment_count: seg_count).first


                requests = (requests + bmr.branded_market_requests) if bmr and not bmr.branded_market_requests.blank?

          end

          requests.uniq

    end


    def build_brand_route_maps(brand)
      

      markets = BrandedMarketSegmentsRequest.branded(brand).pluck(:origin, :dest).sort.uniq

      market_maps = {}

      markets.each do |mkt|
        origin, dest = mkt
        mkt_key = "#{origin}-#{dest}"

        mkt_requests        = market_route_map(brand, origin, dest)
        reverse_mkt_request = market_route_map(brand, dest, origin)
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
        puts JSON.pretty_generate(market_map)
        # byebug
        # pp market_map

      end
      BrandedRouteMap.where(brand_id: brand.id, brand_key: brand.brand_key).destroy_all
      BrandedRouteMap.create(brand_id: brand.id, brand_key: brand.brand_key,
                        route_map: market_maps)

      File.open("#{brand.brand_key.downcase}_route_map.json", 'w') {|f| f.write(
          JSON.pretty_generate(market_maps)
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
