
module Oag
  class Report

   def host_combination_permutation combo
      case combo
      when /combo[0] == combo[1]/

      end

   end
   def through_flights(routes)
       routes.map{ |request1, request2|
          request1.through_flt_request(request2)
       }.compact
   end

   def pricing_request_from_carrier_list(brand, eff_range, origin, dest, cxr_list)
     requests = []
     cxrs_hosts = cxr_list.map{|cxr| {cxr: cxr, host: brand.host_map[cxr]}}
     cxrs_hosts.group_by{|item| item[:host]}.each do |host,item_list|
       requests << BrandedPriceRequest.new(eff_window: eff_range[0], operating_window: eff_range[1],
                                      origin: origin, dest: dest, host: host,
                                      cxrs: item_list.map{|item| item[:cxr]})
     end
     requests
   end


    def build_routes(brand)
      BrandRouteMap.keyed(brand.brand_key).delete_all

      # build_brand_connections(brand)

      connections = BrandConnection.keyed(brand.brand_key)

      connections.group_by{|c| c.market}
      markets = BrandConnection.keyed(brand.brand_key).pluck(:origin, :dest).sort.uniq
      brand_route_maps = []
      itineraries = []
      # # Build the direct schedules

      # # Build the 2 segment routes
      markets.each do |origin,dest|

        h = BrandConnection.all.pluck(:origin, :dest, :eff_window).group_by{|item| [item[0],item[1]]}

        connections = BrandConnection.keyed(brand.brand_key).market(origin,dest)

        route_map = []
        eff_groups = connections.group_by{|cn| [cn.eff_window, cn.operating_window]}
        eff_groups.keys.sort{ |eff_range| eff_range[0]['eff']}.each do |eff_range|
          byebug

          conn_list = eff_groups[eff_range]
          puts "#{eff_range}"
          pp conn_list.map{|c| c.full_key}
          via_grouped = conn_list.group_by{|cn| cn.via}

          via_grouped.each do |via, conn_list|
            puts "#{origin} #{via} #{dest}"


            # leg1_requests = pricing_request_from_carrier_list(brand, eff_range, origin,via, conn_list.map{|conn| conn.sched1.airline_code})
            # leg2_requests = pricing_request_from_carrier_list(brand, eff_range, via,dest, conn_list.map{|conn| conn.sched2.airline_code})
            #
            #
            # combinations = (leg1_requests.product leg2_requests).uniq{|req_array| [req_array[0].key,req_array[1].key]}
            # # Just for Debugging Purposes
            # combinations.each{ |combo| pp [combo.map{|c| c.key}.join('; '), " #{combo[0].eff_window_key}"].join(' ---')   }
            #
            #
            # route_map =  route_map + combinations

          # End via_grouped
          end
          # itineraries = itineraries +
          #        route_map.map{|route| ConstructedItinerary.new(origin:origin, dest: dest, pricing_requests: route)} +
          #        through_flights(route_map).map{|route| ConstructedItinerary.new(origin:origin, dest: dest, pricing_requests: [route])}


          # End eff_range
          end
              # carrier_sequence = [conn.sched1.airline_code, conn.sched2.airline_code]
              # route_map << {
              #       origin: conn.origin, via: conn.via, dest: conn.dest,
              #       eff_window: conn.eff_window,
              #       operating_window: conn.operating_window,
              #       carriers: carrier_sequence,
              #       host: carrier_sequence.map{|cxr| brand.host_map[cxr]}
              #     }

        # brand_route_maps << BrandRouteMap.new(
        #                        brand_key: brand.brand_key,
        #                        origin: origin,
        #                        dest:   dest,
        #                        segments: 2,
        #                        route_map: itineraries.to_json)
      # End Market Groups
      end

      group_size = 1000
      tot = brand_route_maps.count
      brand_route_maps.in_groups_of(group_size) do |brand_route_map_group|

          BrandRouteMap.import brand_route_map_group.compact
          Rails.logger.info "Saving brand route maps #{brand_route_map_group.compact.count} " +
                                   " of #{tot} remaining for #{brand.brand_key}"
          tot = tot - brand_route_map_group.compact.count
      end



      # BrandConnection.new(brand_key: brand.brand_key,
      #                             origin: origin_code, via: via_code, dest: sched2.dest_apt,
      #                             sched1_id: sched1.id,
      #                             sched1_eff_dates: sched1.effective_dates,
      #                             sched1_operating: sched1.arr_op_days,
      #                             sched2_id: sched2.id,
      #                             sched2_eff_dates: sched2.effective_dates,
      #                             sched2_operating: sched2.dep_op_days,
      #                             eff_window: sched1.effective_window(sched2),
      #                             operating_window: sched1.connection_days_of_week(sched2,2) )

      # end

      # Build the 3 segment routes


    end

    def build_brand_connections(brand)
      BrandConnection.keyed(brand.brand_key).delete_all

      origins = OagSchedule.branded(brand.report_keys)
                           .pluck(:origin_apt)
                           .sort.uniq

      routes = []
      brand_connections = []

      origins.each_with_index do |origin_code, index|

        via_points =
            OagSchedule.branded(brand.report_keys)
                .departing(origin_code)
                .pluck(:dest_apt).sort.uniq


        via_points.each_with_index do |via_code, via_index|
            Rails.logger.info "Building connections  " +
                  "for #{origin_code} #{index} of (#{origins.count}) through #{via_code}  " +
                  " #{via_index} of (#{via_points.count})  - #{brand.brand_key}"

           leg1_scheds = OagSchedule.branded(brand.report_keys)
                                    .departing(origin_code)
                                    .arriving(via_code)

           leg2_scheds = OagSchedule.branded(brand.report_keys)
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

  def build_brand_connection_templates(brand)
    BrandConnectionTemplate.keyed(brand.brand_key).delete_all

    templates = []
    connections = BrandConnection.keyed(brand.brand_key)

    markets = connections.pluck(:origin, :dest).sort.uniq


    mkt_groups = BrandConnection.keyed(brand.brand_key).group_by{|c| [c.origin, c.dest]}
    tot = mkt_groups.keys.count

    mkt_groups.each do |k, mkt_conns |

      origin =  k[0]
      dest   =  k[1]
      Rails.logger.info "Building #{tot} remaining from #{mkt_groups.keys.count } " +
                        " market groups connection templates " +
                        "for #{origin}  to #{dest}    - #{brand.brand_key}"

      tot = tot - 1




      cxr_paths =  mkt_conns.group_by{|c|{cxr1: c.sched1_cxr, via: c.via,  cxr2:c.sched2_cxr}}

      cxr_paths.each do |k, path_list|



         path_list.uniq!{|c| [c.eff,c.disc, c.operating_window]}
         path_list.map!{|c|
           BrandConnectionTemplate.new(brand_key: brand.brand_key,
                origin: origin, via: c.via, dest: dest,
                sched1_cxr: c.sched1_cxr, sched2_cxr: c.sched2_cxr,
                eff: c.eff, disc: c.disc, operating_window: c.operating_window)
         }
         templates = templates + path_list
      end

    end

    group_size = 2000
    tot = templates.count
    templates.in_groups_of(group_size) do |template_group|

        BrandConnectionTemplate.import template_group.compact
        Rails.logger.info "Saving brand connection templates #{template_group.compact.count} " +
                          " of #{tot} remaining for #{brand.brand_key}"
        tot = tot - template_group.compact.count
    end

  end

   def merge_op_windows path_list
     op_path_list = path_list.group_by{|p| p.operating_window}
     op_path_list.each do |op_window, paths|

       eff_dates =  paths.map{|p| p.eff..p.disc}.sort_by{|r| r.min}.uniq
       if paths.count > 1
         i = 0
         while (i + 1) < eff_dates.count do
           if eff_dates[i+1] and eff_dates[i].include? eff_dates[i+1]
             eff_dates.delete_at(i+1)
           else
             i = i +1
           end
         end
       end
       op = paths.first
       op_path_list[op_window] = {via: op.via,
                        sched1_cxr: op.sched1_cxr,
                        sched2_cxr: op.sched2_cxr,
                        eff_dates:  eff_dates.map{|r| {eff:r.first, disc: r.last}}
       }


     end
     op_path_list
   end

   def build_brand_op_connection_templates(brand)
    BrandOpConnectionTemplate.keyed(brand.brand_key).delete_all

    templates = []
    connections = BrandConnectionTemplate.keyed(brand.brand_key)

    markets = connections.pluck(:origin, :dest).sort.uniq


    mkt_groups = BrandConnectionTemplate.keyed(brand.brand_key).group_by{|c| [c.origin, c.dest]}
    tot = mkt_groups.keys.count

    mkt_groups.each do |k, mkt_conns |

      origin =  k[0]
      dest   =  k[1]
      Rails.logger.info "Building #{tot} remaining from #{mkt_groups.keys.count } " +
                        " market groups connection templates " +
                        "for #{origin}  to #{dest}    - #{brand.brand_key}"

      tot = tot - 1




      cxr_paths =  mkt_conns.group_by{|c|{cxr1: c.sched1_cxr, via: c.via,  cxr2:c.sched2_cxr}}

      cxr_paths.each do |k, path_list|
         path_list.uniq!{|c| [c.eff,c.disc, c.operating_window]}
         operating_paths = merge_op_windows path_list

         operating_paths.each do |op_window, op|
           templates << BrandOpConnectionTemplate.new(brand_key: brand.brand_key,
                origin: origin, via: op[:via], dest: dest,
                sched1_cxr: op[:sched1_cxr], sched2_cxr: op[:sched2_cxr],
                eff_dates:  op[:eff_dates], operating_window: op_window)
         end
      end

    end

    group_size = 2000
    tot = templates.count
    templates.in_groups_of(group_size) do |template_group|

        BrandOpConnectionTemplate.import template_group.compact
        Rails.logger.info "Saving brand connection templates #{template_group.compact.count} " +
                          " of #{tot} remaining for #{brand.brand_key}"
        tot = tot - template_group.compact.count
    end

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
     byebug
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


   def build_brand_market_routes(brand, origin, dest, segment_count)
       BrandedMarketSegmentsRequest.branded(brand)
                                   .market(origin,dest)
                                   .where(segment_count: segment_count)
                                    .delete_all

       market_requests = []
       case segment_count
         when 1
           market_requests = direct_market_routes(brand, origin, dest)
         when 2
           market_requests = one_stop_market_routes(brand, origin, dest)
         else
           byebug
           "Bad Case"

       end

       unless  market_requests.blank?
       BrandedMarketSegmentsRequest.create(brand_id: brand.id, brand_key: brand.brand_key,
                      origin: origin, dest:dest, segment_count: segment_count,
                      branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
       end




   end

    def build_brand_market_smart_routes(brand)

      byebug
      one_segment_markets = DirectFlight.multi_keyed(brand.report_keys).pluck(:origin, :dest).uniq
      one_segment_markets.each{|origin, dest| build_brand_market_routes(brand, origin, dest, 1)}

      two_segment_markets = BrandConnection.keyed(brand.brand_key).pluck(:origin, :dest).sort.uniq
      two_segment_markets.each_with_index do |market, index |
        origin, dest = market
        Rails.logger.info "Building Two Segment Market Segment Requests  " +
              "for #{origin} #{index} of (#{two_segment_markets.count})  - for brand #{brand.brand_key}"

        build_brand_market_routes(brand, origin, dest, 2)

      end

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
