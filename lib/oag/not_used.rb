class NotUsed
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
     BrandedRouteMap.keyed(brand.brand_key).delete_all

     # build_brand_connections(brand)

     connections = BrandConnection.branded(brand)

     connections.group_by{|c| c.market}
     markets = BrandConnection.branded(brand).pluck(:origin, :dest).sort.uniq
     brand_route_maps = []
     itineraries = []
     # # Build the direct schedules

     # # Build the 2 segment routes
     markets.each do |origin,dest|

       h = BrandConnection.all.pluck(:origin, :dest, :eff_window).group_by{|item| [item[0],item[1]]}

       connections = BrandConnection.branded(brand).market(origin,dest)

       route_map = []
       eff_groups = connections.group_by{|cn| [cn.eff_window, cn.operating_window]}
       eff_groups.keys.sort{ |eff_range| eff_range[0]['eff']}.each do |eff_range|

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

         BrandedRouteMap.import brand_route_map_group.compact
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


def build_brand_connection_templates(brand)
  BrandConnectionTemplate.keyed(brand.brand_key).delete_all

  templates = []
  connections = BrandConnection.branded(brand)

  markets = connections.pluck(:origin, :dest).sort.uniq


  mkt_groups = BrandConnection.branded(brand).group_by{|c| [c.origin, c.dest]}
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
end