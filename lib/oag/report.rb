
module Oag
  class Report



    def build_brand_connections(brand)
      BrandConnection.keyed(brand.brand_key).delete_all

      origins = OagSchedule.branded(brand.report_keys).for_cxrs(['TZ','DD'])
                           .pluck(:origin_apt)
                           .sort.uniq

      routes = []
      brand_connections = []

      origins.each_with_index do |origin_code, index|

        via_points =
            OagSchedule.branded(brand.report_keys).for_cxrs(['TZ','DD'])
                .departing(origin_code)
                .pluck(:dest_apt).sort.uniq


        via_points.each_with_index do |via_code, via_index|
            Rails.logger.info "Building connections  " +
                  "for #{origin_code} #{index} of (#{origins.count}) through #{via_code}  " +
                  " #{via_index} of (#{via_points.count})  - #{brand.brand_key}"

           leg1_scheds = OagSchedule.branded(brand.report_keys).for_cxrs(['TZ','DD'])
                                    .departing(origin_code)
                                    .arriving(via_code)

           leg2_scheds = OagSchedule.branded(brand.report_keys).for_cxrs(['TZ','DD'])
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
      direct_markets = DirectFlight.pair(origin ,dest).multi_keyed(brand.report_keys).compact

      direct_markets.each do |df|
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
       three_segment_connects = Hash.new []
       three_segment_mkt_connects = Hash.new(Hash.new([]))

       two_seg_markets = BrandConnection.keyed(brand.brand_key).pluck(:origin, :dest).sort.uniq
       two_seg_markets.each_with_index do |ts_mkt, index|
         ts_origin, ts_dest = ts_mkt
         Rails.logger.info "(#{brand.brand_key}) Building connections  #{ts_origin} #{ts_dest} for #{index} of (#{two_seg_markets.count}) two seg markets"

         BrandConnection.keyed(brand.brand_key).market(ts_origin, ts_dest).each do |bc|
         # bc_list.each do |bc|
           origin = bc.origin
           connecting_bcs = bc.connects_with.to_a
           destinations = connecting_bcs.pluck(:dest).sort.uniq
           destinations.each do |dest|

             markets = markets | [[origin, dest]]

             three_segment_mkt_connects[[origin, dest]][bc.id] =
                  # connecting_bcs.arriving(dest).map{|other| other.id}
                  connecting_bcs.select{|cbc| cbc.dest == dest}.map{|other| other.id}

           end
         end
       end
       byebug
       pp markets

       markets.each do |origin, dest|

       end

       # mkt_connections = BrandConnection.keyed(brand.brand_key).market(origin,dest)
       #
       # routes =  mkt_connections.to_a.uniq{|c| c.key}
       #
       # routes_requests = routes.map{|c| c.to_route_requests}
       #
       # grouped_rrs = routes_requests.group_by{|mkt_rr| mkt_rr.map{|rr| rr.host_market_key}}
       # grouped_rrs.each do |keys, group|
       #      brr0 =
       #      BrandedRouteRequest.where(
       #      group.first[0].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
       #          .merge(cxrs: group.map{|rr_list| rr_list[0].cxrs}
       #          .flatten.sort.uniq)
       #      ).first_or_create!
       #      brr1 =
       #      BrandedRouteRequest.where(
       #      group.first[1].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
       #          .merge(cxrs: group.map{|rr_list| rr_list[1].cxrs}
       #          .flatten.sort.uniq)
       #      ).first_or_create!
       #
       #      bmr = BrandedMarketRequest.joins(:branded_route_requests)
       #                .where(BrandedRouteRequest[:id].in [brr0.id, brr1.id])
       #                .where(brand_key: brand.brand_key, brand_id: brand.id,
       #                       origin: origin, dest: dest).first_or_create!
       #
       #      bmr.branded_route_requests << [brr0,brr1] if  bmr.branded_route_requests.blank?
       #
       #      grouped_rrs[keys] = bmr
       #
       # end
       # mkt_route_requests = grouped_rrs.values
       #
       # through_requests = mkt_route_requests.map{|bmr| bmr.through_market_request}.compact
       # market_route_map = mkt_route_requests + through_requests
       # market_route_map.compact
    end


   # def two_stop_market_routes(brand, origin, dest)
   #
   #     #  2 Stops
   #      mkt_connections = BrandConnection.keyed(brand.brand_key).market(origin,dest)
   #      routes =  mkt_connections.to_a.uniq{|c| c.key}
   #      segmented_routes_requests = routes.map{|c| c.to_route_requests}
   #
   #      byebug
   #      grouped_rrs = routes_requests.group_by{|mkt_rr| mkt_rr.map{|rr| rr.host_market_key}}
   #      grouped_rrs.each do |keys, group|
   #           brr0 =
   #           BrandedRouteRequest.where(
   #           group.first[0].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
   #               .merge(cxrs: group.map{|rr_list| rr_list[0].cxrs}
   #               .flatten.sort.uniq)
   #           ).first_or_create!
   #           brr1 =
   #           BrandedRouteRequest.where(
   #           group.first[1].attributes.deep_symbolize_keys.except(:id, :cxrs, :key)
   #               .merge(cxrs: group.map{|rr_list| rr_list[1].cxrs}
   #               .flatten.sort.uniq)
   #           ).first_or_create!
   #
   #           bmr = BrandedMarketRequest.joins(:branded_route_requests)
   #                     .where(BrandedRouteRequest[:id].in [brr0.id, brr1.id])
   #                     .where(brand_key: brand.brand_key, brand_id: brand.id,
   #                            origin: origin, dest: dest).first_or_create!
   #
   #           bmr.branded_route_requests << [brr0,brr1] if  bmr.branded_route_reqRails air_sched: developmentuests.blank?
   #
   #           grouped_rrs[keys] = bmr
   #
   #      end
   #      mkt_route_requests = grouped_rrs.values
   #
   #      byebug
   #      through_requests = mkt_route_requests.map{|bmr| bmr.through_market_request}.compact
   #      market_route_map = mkt_route_requests + through_requests
   #      market_route_map.compact
   #   end


   def build_brand_market_routes(brand, segment_count)
       BrandedMarketSegmentsRequest.branded(brand)
                                   .where(segment_count: segment_count)
                                    .delete_all

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
           unless  market_requests.blank?
                  BrandedMarketSegmentsRequest.create(brand_id: brand.id, brand_key: brand.brand_key,
                                 origin: origin, dest:dest, segment_count: segment_count,
                                 branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
           end
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

      # build_brand_market_routes(brand, 1)

      # ActiveRecord::Base.logger.level = 2
      # build_brand_market_routes(brand, 2)

      build_brand_market_routes(brand, 3)



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
