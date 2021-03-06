require 'benchmark'
module Oag
  class Report




    def build_brand_connections(brand)

      filtered_cxrs = []

      # CURRENTLY DOES NOT SUPPORT EMBEDDED SEGMENTS, AS THE SCHEDULE MODEL DOESN'T KNOW THE VIA POINT
      # AND FURTHER MORE YOU CAN End Up with Circle Trip Flights like TR 2771
      origins = brand.origins.pluck(:origin_apt).sort
      destinations = brand.destinations.pluck(:dest_apt).sort


      routes = Set.new
      brand_connections = []
      total_origins = origins.count
      Rails.logger.info "BRAND CONNECTIONS (#{brand.brand_key})  #{total_origins} origins."

      origins.each_with_index do |origin_code, index|
        Rails.logger.info "BRAND CONNECTIONS (#{brand.brand_key})  #{index} of #{origins.count} origins."

        via_points = brand.current_schedules.departing(origin_code).select(:dest_apt).distinct.pluck(:dest_apt).sort

        # via_points.each_with_index do |via_code, via_index|
        Parallel.each_with_index(via_points, in_threads:4) do |via_code, via_index|


           log_debug_string(brand, origin_code, index, origins, via_code, via_index, via_points)
           leg1_scheds = brand.current_schedules.departing(origin_code).arriving(via_code)
           leg2_scheds = brand.current_schedules.departing(via_code).reject{|sched| sched.dest_apt == origin_code}

           possible_routes = Set.new

            leg1_scheds.each do |sched1|
              leg2_scheds.each do |sched2|
                window    = sched1.effective_window(sched2)
                op_window = sched1.connection_days_of_week(sched2,2)
                if not window.blank? and not op_window.blank?
                  # possible_routes <<  BrandConnection.new(brand: brand,
                  #           origin: origin_code, via: via_code, dest: sched2.dest_apt,
                  #           sched1_cxr: sched1.airline_code, sched2_cxr: sched2.airline_code,
                  #           sched1_id: sched1.id,
                  #           sched1_eff_dates: sched1.effective_dates,
                  #           sched1_operating: sched1.arr_op_days,
                  #           sched2_id: sched2.id,
                  #           sched2_eff_dates: sched2.effective_dates,
                  #           sched2_operating: sched2.dep_op_days,
                  #           eff: window[:eff].to_date,
                  #           disc: window[:disc].to_date,
                  #           operating_window: op_window )
                  routes <<  [
                                brand.id,  # brand
                                origin_code,  # origin
                                via_code,  # via
                                sched2.dest_apt,  # dest
                                sched1.airline_code,  # sched1_cxr
                                sched2.airline_code,  # sched2_cxr
                                sched1.id,  # sched1_id
                                sched1.effective_dates,  # sched1_eff_dates
                                sched1.arr_op_days,  # sched1_operating
                                sched2.id,  # sched2_id
                                sched2.effective_dates,  # sched2_eff_dates
                                sched2.dep_op_days,  # sched2_operating
                                window[:eff].to_date,  # eff
                                window[:disc].to_date,  # disc
                                op_window #operating_window
                                ]
                end
              end
            end
           # possible_routes.uniq!{|route| [route.dest, route.eff_window, route.operating_window]  }
           # byebug
           # routes << possible_routes

        end
        # byebug
        # routes < routes_for_origin.compact.flatten(1)
      end
      # byebug
      # routes = routes.compact.flatten

      group_size = 5000
      total_branded_connections = routes.count
      tot = routes.count


      BrandConnection.branded(brand).delete_all
      columns = [
                  :brand_id,
                  :origin,
                  :via,
                  :dest,
                  :sched1_cxr,
                  :sched2_cxr,
                  :sched1_id,
                  :sched1_eff_dates,
                  :sched1_operating,
                  :sched2_id,
                  :sched2_eff_dates,
                  :sched2_operating,
                  :eff,
                  :disc,
                  :operating_window
      ]
      routes_array = routes.to_a
      routes_array.in_groups_of(group_size) do |connection_group|
          BrandConnection.import(columns, connection_group.compact, :validate => false)
          # BrandConnection.import(connection_group.compact, :validate => false)
          Rails.logger.info "Saving brand connections #{connection_group.compact.count} " +
                            " of #{tot} remaining for #{brand.brand_key}"
          tot = tot - connection_group.compact.count
      end
      brand.data_state.stats['branded_connections'] = {'count': total_branded_connections, 'updated_at': DateTime.now.in_time_zone }
      brand.save
      brand.data_state.confirm_connections!



    end


    def build_brand_smart_routes(brand, seg_counts)

      seg_counts.each do |seg_count|
        Rails.logger.info "Deleting BrandedMarketSegmentsRequest segments with #{brand.name} segs(#{seg_count})"

        BrandedMarketSegmentsRequest.branded(brand).with_segs(seg_count).destroy_all
        # BrandedRouteRequest.branded(brand).destroy_all
        # BrandedMarketRequest.branded(brand).destroy_all



        build_brand_market_routes(brand, seg_count)

      end
      counts_array = BrandedMarketSegmentsRequest.branded(brand).pluck('DISTINCT segment_count')
      counts_array.map!{ |c| { segs: c, count: BrandedMarketSegmentsRequest.branded(brand).with_segs(c).count} }

      brand.data_state.stats['smart_routes'] = {'count': counts_array, 'updated_at': DateTime.now.in_time_zone }
      brand.save
      brand.data_state.confirm_smart_routes!


    end


    def build_brand_route_maps(brand, seg_counts)


      markets = BrandedMarketSegmentsRequest.branded(brand).pluck(:origin, :dest).sort.uniq

      market_maps = {}

      Parallel.each_with_index(markets, in_threads: 4) do |mkt,mkt_index|

      # markets.each_with_index do |mkt,mkt_index|

        origin, dest = mkt
        mkt_key = "#{origin}-#{dest}"
        Rails.logger.info "(#{brand.brand_key}) Building route map for market  #{mkt_key} #{mkt_index+1} of (#{markets.count})"

        # if mkt_key.eql? "CNX-BFV"
        #      byebug
        # end
        bmrm = branded_market_route_map( brand, origin, dest, seg_counts)




        #TODO:  Don't store the market route maps in the total route_map, instead store a reference to market_route map
        market_map = {"#{mkt_key}" => bmrm.route_map  }



        market_maps.merge! market_map

      end

      branded_route_map = BrandedRouteMap.where(brand: brand).first_or_create!
      #  Let's set an insert order for better JSON exprting
      sorted_hash = {}
      market_maps.keys.sort.each do |k|
        sorted_hash[k] = market_maps[k]
      end
      branded_route_map.route_map = sorted_hash
      branded_route_map.save


      brand.data_state.stats['route_maps'] = {'updated_at': DateTime.now.in_time_zone , 'markets': market_maps.keys.count}
      brand.save
      brand.data_state.confirm_route_maps!


    end


    def brand_route_map_document(brand)
         brm = BrandedRouteMap.branded(brand)
         unless brm.blank?
           JSON.pretty_generate(brm.route_map)
         else
           JSON.pretty_generate({})
         end
       end


    def brand_route_map_validations_document(brand)
      # Possible of use?
      # User.includes(:posts).where('posts.desc = "ruby is awesome"').to_a
      # http://blog.bigbinary.com/2013/07/01/preload-vs-eager-load-vs-joins-vs-includes.html

      csv_string = CSV.generate do |csv|
        csv << ['origin', 'dest', 'segments', 'solution' ]
        implied_markets = ImpliedMarket.where(brand: brand)
        implied_markets.each do |market|
          market.branded_route_map_validator.rows.each do |row|
            csv << row
          end
        end
      end
      csv_string
    end



    def export_brand_route_maps(brand)
      File.open("#{brand.brand_key.downcase}_route_map.json", 'w') {|f| f.write(
              brand_route_map_document(brand)
            )
      }
    end


    # ###############
    #
    #  Data Validation Methods
    #
    # ###############

    def build_implied_markets(brand, origins, destinations)

        ImpliedMarket.where(brand: brand).destroy_all
        markets = origins.product destinations
        imp_markets_array = []
        Rails.logger.info "Building implied markets for  #{brand.brand_key} Total:  #{markets.count}"

        markets.each do |o,d|
          i_m = ImpliedMarket.new(brand: brand, origin: o, dest: d)
          imp_markets_array << i_m unless o == d
        end

        imp_markets_array.sort!
        ImpliedMarket.import imp_markets_array

    end

    def build_route_map_validations(brand)

      implied_markets = ImpliedMarket.where(brand: brand)

      tot_implied_markets = implied_markets.count

      # Cap the batch to 500 to protect against memory pressure
      group_size = 500
      implied_markets_count = implied_markets.count
      remaining_count = implied_markets_count
      implied_markets.in_groups_of(group_size, false) do |market_group|
        Rails.logger.info "(#{brand.brand_key}) Looking Up Route map validator for group of #{group_size}, from #{remaining_count} out of #{implied_markets_count} Implied Markets"
          curr_group_size = market_group.size
          Parallel.each_with_index(market_group, in_threads:4) do |i_m, idx|
          # implied_markets.each_with_index do |i_m, idx|

                validator = i_m.create_branded_route_map_validator
                Rails.logger.info "(#{brand.brand_key}) Looking Up Route map validator for market  #{i_m.origin}-#{i_m.dest} #{idx+1} of (#{curr_group_size} - #{remaining_count} from #{tot_implied_markets})"

                [*1..brand.settings.max_segments].each do |seg_number|

                    validator.route_map_counts[seg_number] =
                                     BrandedMarketRequest.branded(brand).market(i_m.origin, i_m.dest).segments(seg_number).count
                    validator.route_map_structures[seg_number] = Set.new
                    bmrs = BrandedMarketRequest.where(brand:brand, origin: i_m.origin, dest: i_m.dest, seg_count: seg_number )
                    bmrs.each do |bmr|
                      validator.route_map_structures[seg_number] << bmr.branded_route_requests.map{|brr| brr.key}
                    end
                    validator.save
                end
          end


        remaining_count = remaining_count - group_size
      end





   end
  private

    # ###############
    #
    #  utility
    #
    # ###############

    def log_debug_string(brand, origin_code, index, origins, via_code, via_index, via_points)
         Rails.logger.info "(#{brand.brand_key}) Building branded connections  " +
                         "for #{origin_code} #{index + 1} of (#{origins.count}) through #{via_code}  " +
                         " #{via_index + 1} of (#{via_points.count})  - #{brand.brand_key}"
     end



    def build_potential_markets(brand)

      PotentialBrandedMarket.destroy_all(brand: brand)
      all_markets = brand.all_possible_markets
      all_markets.each do |origin, dest|
        PotentialBrandedMarket.create(brand: brand, origin:origin, dest:dest)
      end

    end
    def build_potential_carriers(brand)

       PotentialBrandedMarket.destroy_all(brand: brand)
       all_carriers = brand.all_possible_carriers
       all_carriers.each do |carrier|
         PotentialBrandedMarket.create(brand: brand, cxr: carrier.code, carrier_name: carrier.name)
       end

    end

    def build_potential_routes(brand)
     all_markets = PotentialBrandedMarket.brand(brand)
     seg_counts_array = [*1..brand.max_segments]
     market_solutions = Hash.new { |h, k| h[k] = Set.new }
     # seg_counts_array.each do |seg_num|
     #   solutions  =
     #       case segment_count
     #                when 1

         # PotentialBrandedMarket.destroy_all(brand: brand)
         # all_carriers = brand.all_possible_carriers
         # all_carriers.each do |carrier|
         #   PotentialBrandedMarket.create(brand: brand, cxr: carrier.code, carrier_name: carrier.name)
         # end

    end




    # ###############
    #
    #  Detailed Methods to Accomplish Data Processing
    #
    # ###############
    def direct_market_routes(brand)
       #  No Stops
        one_segment_markets = DirectFlight.branded(brand).pluck(:origin, :dest).uniq
        direct_route_requests = Hash.new { |h, k| h[k] = Set.new }

        one_segment_markets.each_with_index do |mkt, index|
            origin, dest = mkt
            Rails.logger.info " ==== (#{brand.brand_key}) Building One Segment mkt requests  for #{origin} #{dest} "
            Rails.logger.info " ==== (#{brand.brand_key}) Building #{index} of (#{one_segment_markets.count}) "

            mkt_operating_carriers = brand.current_schedules.market(origin, dest).select(:airline_code).distinct.pluck(:airline_code)

            hostcodes = brand.hostcodes_map
            #  TODO:  Possbily Group Common Host with Multiple Carriers into the same RouteRequest
            mkt_operating_carriers.each do |cxr|
                host_codes = hostcodes[cxr]
                host_codes.to_a.each do |host_code|
                    brr = BrandedRouteRequest.find_or_create_by( brand: brand, origin: origin, dest: dest, host: host_code, cxrs: [cxr]  )
                    #   There should be only 1 BrandedMarketRequest for this BrandedRouteRequest
                    bmrrs = brr.branded_market_requests.where(seg_count: 1)

                    if bmrrs.blank?
                       bmr =  BrandedMarketRequest.create(brand: brand, origin: origin, dest: dest, seg_count: 1)
                       bmr.branded_route_requests << brr
                       bmr.save
                       direct_route_requests[mkt] << bmr
                    else
                      direct_route_requests[mkt] << bmrrs.first
                    end
                end

            end
        end

        total_direct_markets =  direct_route_requests.keys.count
        ActiveRecord::Base.transaction do
          direct_route_requests.keys.each_with_index do |k, direct_mkt_idx|

                  Rails.logger.info "(#{brand.brand_key}) Saving 1 Segment Routes for #{k.first}-#{k.last}, #{direct_mkt_idx+1} of (#{total_direct_markets}) "
                  bmr_set = direct_route_requests[k]
                  BrandedMarketSegmentsRequest.create(brand: brand,
                            origin: k.first, dest:k.last, segment_count: 1,
                            branded_market_request_ids: bmr_set.map{|bmr| bmr.id} )
          end
        end


     end


    def faster_one_stop_routes(brand)

       query_string = ' SELECT
          b1.origin        origin,
          b1.via        AS via,
          b1.dest       AS dest,
          b1.sched1_cxr AS cxr1,
          b1.sched2_cxr AS cxr2,
          b1.brand_id
        FROM brand_connections b1
        WHERE
          b1.brand_id = ?
        GROUP BY b1.origin, b1.dest, b1.via, b1.sched1_cxr, b1.sched2_cxr, b1.brand_id

        ORDER BY b1.origin ASC, b1.dest ASC, b1.via ASC'

       two_seg_branded_market_requests = Hash.new { |h, k| h[k] = Set.new }
       good_ones =  BrandConnection.find_by_sql( [query_string, brand.id])



       total_good_connections = good_ones.count
       hostcodes = brand.hostcodes_map

       Parallel.each_with_index(good_ones, in_threads: 8) do |good_rrs, two_seg_cnx_idx|
       # good_ones.each_with_index do |good_rrs, two_seg_cnx_idx|
                Rails.logger.info "(#{brand.brand_key}) Building  2 Segment Routes for #{good_rrs.origin}, #{good_rrs.dest}, #{good_rrs.via}, #{two_seg_cnx_idx+1} of (#{total_good_connections} connections) "

                host_codes = hostcodes[good_rrs.cxr1]
                rr1_s = host_codes.map{ |host_code|
                      BrandedRouteRequest.where(brand: brand, origin: good_rrs.origin, dest: good_rrs.via, cxrs: [good_rrs.cxr1], host: host_code).first_or_create!
                }
                host_codes = hostcodes[good_rrs.cxr2]
                rr2_s = host_codes.map{ |host_code|
                  BrandedRouteRequest.where(brand: brand, origin: good_rrs.via,  dest: good_rrs.dest, cxrs: [good_rrs.cxr2], host: host_code).first_or_create!
                }



                rrs_per_host = rr1_s.product rr2_s

                rrs_per_host.each do |host_rrs|
                  all_branded_market_requests = host_rrs.map{|rr| rr.branded_market_requests.where(seg_count: 2)}
                  bmrrs_intersection = all_branded_market_requests.inject(:&)

                  raise("There should only be 1 Branded Market Request for brrs #{host_rrs.map{|rr| rr.id}}") if bmrrs_intersection.count > 1


                  if bmrrs_intersection.blank?
                    bmr =  BrandedMarketRequest.new(brand: brand, origin: good_rrs.origin, dest: good_rrs.dest, seg_count: 2)
                    bmr.branded_route_requests << rrs_per_host

                  else
                    bmr = bmrrs_intersection.first
                  end

                  two_seg_branded_market_requests[[bmr.origin, bmr.dest]] << bmr
                end
        end


       # # TODO Method 1
       # #TODO Make this use less memory
       # group_size = 5000
       # total_bmr_count = two_seg_branded_market_requests.count
       # remaining_count = total_bmr_count
       # two_seg_branded_market_requests.values.in_groups_of(group_size, false) do |value_group|
       #   Rails.logger.info "(#{brand.brand_key}) Saving group of #{group_size}, from #{remaining_count} out of #{total_bmr_count} Two Segment BrandedMarketRequests"
       #   ActiveRecord::Base.transaction do
       #     value_group.each{|bmr_list| bmr_list.each{|bmr| bmr.save}}
       #   end
       #   remaining_count = remaining_count - group_size
       # end
       #
       #
       #
       # Rails.logger.info "(#{brand.brand_key}) Building #{total_bmr_count} Two Segment BrandedMarketSegmentsRequest. "
       # total_two_seg_markets =  two_seg_branded_market_requests.keys.count
       # bmsrs = []
       # two_seg_branded_market_requests.keys.each_with_index do |k, two_seg_mkt_idx|
       #
       #       Rails.logger.info "(#{brand.brand_key}) Saving 2 Segment Routes for #{k.first}-#{k.last}, #{two_seg_mkt_idx+1} of (#{total_two_seg_markets} markets) "
       #       bmr_set = two_seg_branded_market_requests[k]
       #       bmsrs <<    BrandedMarketSegmentsRequest.build(brand: brand, origin: k.first, dest:k.last, segment_count: 2,
       #                                                 branded_market_request_ids: bmr_set.map{|bmr| bmr.id} )
       # end
       #
       # total_bmsrs = bmsrs.count
       # remaining_count = total_bmsrs
       #
       # bmsrs.in_groups_of(group_size, false) do |bmsr_group|
       #   Rails.logger.info "(#{brand.brand_key}) Importing group of #{group_size} Two Segment BMSRS of #{remaining_count} from (#{total_bmsrs})"
       #   BrandedMarketSegmentsRequest.import bmsr_group
       #   remaining_count = remaining_count - group_size
       # end


       # TODO Method 2


       total_bmr_count = two_seg_branded_market_requests.count
       Rails.logger.info "(#{brand.brand_key}) Saving #{total_bmr_count} Two Segment BrandedMarketRequests. "
       ActiveRecord::Base.transaction do
              two_seg_branded_market_requests.values.each{|bmr_list| bmr_list.each{|bmr|  bmr.save}}
       end


       Rails.logger.info "(#{brand.brand_key}) Saving #{total_bmr_count} Two Segment BrandedMarketSegmentsRequest. "
       ActiveRecord::Base.transaction do
          total_two_seg_markets =  two_seg_branded_market_requests.keys.count
          two_seg_branded_market_requests.keys.each_with_index do |k, two_seg_mkt_idx|

             Rails.logger.info "(#{brand.brand_key}) Saving 2 Segment Routes for #{k.first}-#{k.last}, #{two_seg_mkt_idx+1} of (#{total_two_seg_markets} markets) "
             bmr_set = two_seg_branded_market_requests[k]
             BrandedMarketSegmentsRequest.create(brand: brand, origin: k.first, dest:k.last, segment_count: 2,
                                                 branded_market_request_ids: bmr_set.map{|bmr| bmr.id} )
          end
       end
     Rails.logger.info " ==== (#{brand.brand_key}) COMPLETED Building and Saving Two Segment Routes "

     end


    def low_memory_one_stop_market_routes(brand)
        # redis = Redis.new(host:  '127.0.0.1', port: 6379, db: 10)

        #  1 `Stops
       one_stop_markets = BrandConnection.branded(brand).select(:origin,:dest).distinct.pluck(:origin, :dest).sort

       one_stop_markets_count = one_stop_markets.count
       Parallel.each_with_index(one_stop_markets, in_threads: 12) do |market, index|
           # two_segment_markets.each_with_index do |market, index|

             origin, dest = market

             Rails.logger.info " ==== (#{brand.brand_key}) Building Two Segment mkt requests  for #{origin} #{dest} #{index} of (#{one_stop_markets_count}) "




              connections_for_market = BrandConnection.branded(brand).market(origin,dest)

              uniq_routes =  connections_for_market.to_a.uniq{|c| c.key}

              uniq_routes_requests = Set.new
              uniq_routes.each do |c|
                c.to_route_requests.each do |rr|
                    uniq_routes_requests << rr
                end
              end
              grouped_rrs = uniq_routes_requests.group_by{|mkt_rr| mkt_rr.map{|rr| rr.host_market_key}}
              branded_market_requests = Set.new
              grouped_rrs.each do |host_market_key, group|
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

                  raise("There should only be 1 Branded Market Request for brr1_id #{brr1.id} brr2_id #{brr2.id}") if bmrrs_intersection.count > 1

                  if bmrrs_intersection.blank?
                  bmr =  BrandedMarketRequest.new(brand: brand, origin: origin, dest: dest, seg_count: 2)
                  bmr.branded_route_requests << [brr1,brr2]
                  bmr.save

                  else
                   bmr = bmrrs_intersection.first

                  end


                  branded_market_requests << bmr
                  # grouped_rrs[keys] = bmr

              end

             total_one_stop_markets =  branded_market_requests.count
             Rails.logger.info "(#{brand.brand_key}) Bulk Saving #{total_one_stop_markets} Two Segment Market Requests "

             ActiveRecord::Base.transaction do
               branded_market_requests.each{ |bmr| bmr.save! }
             end


              # Currently through_market_request is returning nil and compacting into an empty array
              through_requests = branded_market_requests.map{|bmr| bmr.through_market_request}.compact
              market_requests = branded_market_requests.to_a + through_requests

              market_requests.compact

              unless  market_requests.blank?
                  BrandedMarketSegmentsRequest.create(brand: brand,
                                                   origin: origin, dest:dest, segment_count: 2,
                                                   branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
              end
         end



     end
    def one_stop_market_routes(brand)

        #  1 Stops
       one_stop_markets = BrandConnection.branded(brand).select(:origin,:dest).distinct.pluck(:origin, :dest).sort

       one_stop_markets_count = one_stop_markets.count
       Parallel.each_with_index(one_stop_markets, in_threads: 12) do |market, index|
           # two_segment_markets.each_with_index do |market, index|

             origin, dest = market

             Rails.logger.info " ==== (#{brand.brand_key}) Building Two Segment mkt requests  for #{origin} #{dest} #{index} of (#{one_stop_markets_count}) "




              connections_for_market = BrandConnection.branded(brand).market(origin,dest)

              uniq_routes =  connections_for_market.to_a.uniq{|c| c.key}

              uniq_routes_requests = Set.new
              uniq_routes.each do |c|
                c.to_route_requests.each do |rr|
                    uniq_routes_requests << rr
                end
              end
              grouped_rrs = uniq_routes_requests.group_by{|mkt_rr| mkt_rr.map{|rr| rr.host_market_key}}
              branded_market_requests = Set.new
              grouped_rrs.each do |host_market_key, group|
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

                  raise("There should only be 1 Branded Market Request for brr1_id #{brr1.id} brr2_id #{brr2.id}") if bmrrs_intersection.count > 1

                  if bmrrs_intersection.blank?
                  bmr =  BrandedMarketRequest.new(brand: brand, origin: origin, dest: dest, seg_count: 2)
                  bmr.branded_route_requests << [brr1,brr2]
                  bmr.save

                  else
                   bmr = bmrrs_intersection.first

                  end


                  branded_market_requests << bmr
                  # grouped_rrs[keys] = bmr

              end

             total_one_stop_markets =  branded_market_requests.count
             Rails.logger.info "(#{brand.brand_key}) Bulk Saving #{total_one_stop_markets} Two Segment Market Requests "

             ActiveRecord::Base.transaction do
               branded_market_requests.each{ |bmr| bmr.save! }
             end


              # Currently through_market_request is returning nil and compacting into an empty array
              through_requests = branded_market_requests.map{|bmr| bmr.through_market_request}.compact
              market_requests = branded_market_requests.to_a + through_requests

              market_requests.compact

              unless  market_requests.blank?
                  BrandedMarketSegmentsRequest.create(brand: brand,
                                                   origin: origin, dest:dest, segment_count: 2,
                                                   branded_market_request_ids: market_requests.map{|bmr| bmr.id} )
              end
         end



     end


    def faster_two_stop_routes(brand)



       query_string = 'select b1.origin as origin, b1.via as via1, b1.dest as via2, b2.dest as dest,  b1.sched1_cxr as cxr1,
              b1.sched2_cxr as cxr2, b2.sched2_cxr as cxr3, b1.brand_id, b2.brand_id
              from brand_connections b1 join
              brand_connections b2
              ON b1.brand_id = b2.brand_id
              where
              b2.dest != b1.origin AND
              b1.brand_id = ? AND
              b2.brand_id = ? AND
              b1.sched2_id = b2.sched1_id
              GROUP BY b1.origin, b2.dest, b1.via, b1.dest, b1.sched1_cxr, b1.sched2_cxr,  b2.sched2_cxr, b1.brand_id, b2.brand_id
              ORDER BY  b1.origin ASC, b2.dest ASC, b1.via, b1.dest'



          three_seg_branded_market_requests = Hash.new { |h, k| h[k] = Set.new }
          Rails.logger.info "Executing Massive sql query."

          good_ones =  BrandConnection.find_by_sql( ['EXPLAIN ' + query_string, brand.id, brand.id])
          good_ones =  BrandConnection.find_by_sql( [query_string, brand.id, brand.id])

          total_good_connections = good_ones.count

          hostcodes = brand.hostcodes_map
          Parallel.each_with_index(good_ones, in_threads: 8) do |good_rrs, three_seg_cnx_idx|

          # good_ones.each_with_index do |good_rrs, three_seg_cnx_idx|
            Rails.logger.info "(#{brand.brand_key}) Building  3 Segment Routes for #{good_rrs.origin}, #{good_rrs.dest}, #{good_rrs.via1}, #{good_rrs.via2}, #{three_seg_cnx_idx+1} of (#{total_good_connections} connections) "

                   host_codes = hostcodes[good_rrs.cxr1]
                   rr1_s = host_codes.map{ |host_code|
                         BrandedRouteRequest.where(brand: brand, origin: good_rrs.origin, dest: good_rrs.via1, cxrs: [good_rrs.cxr1], host: host_code).first_or_create!
                   }
                   host_codes = hostcodes[good_rrs.cxr2]
                   rr2_s = host_codes.map{ |host_code|
                     BrandedRouteRequest.where(brand: brand, origin: good_rrs.via1,  dest: good_rrs.via2, cxrs: [good_rrs.cxr2], host: host_code).first_or_create!
                   }
                   host_codes = hostcodes[good_rrs.cxr3]
                   rr3_s = host_codes.map{ |host_code|
                     BrandedRouteRequest.where(brand: brand, origin: good_rrs.via2, dest: good_rrs.dest, cxrs: [good_rrs.cxr3], host: host_code).first_or_create!
                   }

                   combinations = (rr1_s.product rr2_s).uniq.product rr3_s
                   rrs_per_host = combinations.map{|j| j[0] +[ j[1]]}

                   rrs_per_host.each do |host_rrs|
                     all_branded_market_requests = host_rrs.map{|rr| rr.branded_market_requests.where(seg_count: 3)}
                     bmrrs_intersection = all_branded_market_requests.inject(:&)

                     raise("There should only be 1 Branded Market Request for brrs #{host_rrs.map{|rr| rr.id}}") if bmrrs_intersection.count > 1


                     if bmrrs_intersection.blank?
                       bmr =  BrandedMarketRequest.new(brand: brand, origin: good_rrs.origin, dest: good_rrs.dest, seg_count: 3)
                       bmr.branded_route_requests << rrs_per_host

                     else
                       bmr = bmrrs_intersection.first
                     end

                     three_seg_branded_market_requests[[bmr.origin, bmr.dest]] << bmr
                   end
          end


        #TODO make this use less Memory
        ActiveRecord::Base.transaction do
          three_seg_branded_market_requests.values.each{|bmr_list| bmr_list.each{|bmr|  bmr.save}}
        end
        ActiveRecord::Base.transaction do

          total_three_seg_markets =  three_seg_branded_market_requests.keys.count
          three_seg_branded_market_requests.keys.each_with_index do |k, three_seg_mkt_idx|

             Rails.logger.info "(#{brand.brand_key}) Saving 3 Segment Routes for #{k.first}-#{k.last}, #{three_seg_mkt_idx+1} of (#{total_three_seg_markets} markets) "
             bmr_set = three_seg_branded_market_requests[k]
             BrandedMarketSegmentsRequest.create(brand: brand, origin: k.first, dest:k.last, segment_count: 3,
                                                 branded_market_request_ids: bmr_set.map{|bmr| bmr.id} )
          end
        end

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
          Parallel.each_with_index(branded_connections, in_threads:12) do |bc, idx|
          # branded_connections.each_with_index do |bc, idx|

            bc_list = BrandConnection.branded(brand).connecting_brand_connections(bc)
            unless bc_list.blank?

              Rails.logger.info "(#{brand.brand_key}) Checking Connections on connection  #{idx} of #{total} posible branded connections"
              #  Merge any list for duplicate key
              conn_pairs[bc.route_cxrs_hash_key].merge  bc_list
            else
              # Rails.logger.info "(#{brand.brand_key}) Skipping Connections (No connection)  #{idx} of #{total} posible branded connections"

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

                # if mkt.eql? ['TPE','CNX']
                #   byebug
                # end

                # Do the first  legs
                host_codes = hostcodes[tsr_1[:c1]]
                rr1_s = host_codes.map{ |host_code|
                      BrandedRouteRequest.where(brand: brand, origin: tsr_1[:o],  dest: tsr_1[:v],
                              cxrs: [tsr_1[:c1]], host: host_code).first_or_create!
                  }
                host_codes = hostcodes[tsr_1[:c2]]
                rr2_s = host_codes.map{ |host_code|
                      BrandedRouteRequest.where(brand: brand, origin: tsr_1[:v],  dest: tsr_1[:d],
                              cxrs: [tsr_1[:c2]], host: host_code).first_or_create!
                }
                host_codes = hostcodes[tsr_2[:c2]]
                rr3_s = host_codes.map{ |host_code|
                      BrandedRouteRequest.where(brand: brand, origin: tsr_2[:v],  dest: tsr_2[:d],
                              cxrs: [tsr_2[:c2]], host: host_code).first_or_create!
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

            Rails.logger.info "(#{brand.brand_key}) Saving 3 Segment Routes for #{k.first}-#{k.last}, #{three_seg_mkt_idx+1} of (#{total_three_seg_markets}) "
            bmr_set = three_seg_branded_market_requests[k]
            BrandedMarketSegmentsRequest.create(brand: brand,
                      origin: k.first, dest:k.last, segment_count: 3,
                      branded_market_request_ids: bmr_set.map{|bmr| bmr.id} )
          end



      end


    def build_brand_market_routes(brand, segment_count)
      Rails.logger.info "Deleting BrandedMarketSegmentsRequest  with #{brand.name} segs(#{segment_count})"

      BrandedMarketSegmentsRequest.branded(brand)
                                   .where(segment_count: segment_count).destroy_all

      Rails.logger.info "Deleting BrandedMarketRequest  with #{brand.name} segs(#{segment_count})"

       market_requests = []
       case segment_count
         when 1
           BrandedMarketRequest.destroy_all(brand: brand, seg_count: 1)

           market_requests = direct_market_routes(brand)


         when 2
           BrandedMarketRequest.destroy_all(brand: brand, seg_count: 2)
           # market_requests = one_stop_market_routes(brand)
           market_requests = faster_one_stop_routes(brand)


         when 3

           BrandedMarketRequest.destroy_all(brand: brand, seg_count: 3)
           Rails.logger.info "Building faster_two_stop_routes for brand #{brand.name}"

           market_requests = faster_two_stop_routes(brand)
           # market_requests = two_stop_routes(brand)
         else
           "Bad Case"

       end




   end

    def branded_market_route_map(brand, origin, dest, seg_counts)


      bmrm = BrandedMarketRouteMap.find_or_create_by(brand: brand, origin: origin, dest: dest)

      requests = Set.new
      reverse_requests = Set.new


      seg_counts.each do |seg_count|
            bmsr = BrandedMarketSegmentsRequest.find_by(brand: brand, origin: origin, dest: dest, segment_count: seg_count)

            bmsr.branded_market_requests.each{|bmr| requests << bmr} if bmsr

      end


      seg_counts.each do |seg_count|
            bmsr =   BrandedMarketSegmentsRequest.find_by(brand: brand, origin: dest, dest: origin, segment_count: seg_count)

            bmsr.branded_market_requests.each{|bmr| reverse_requests << bmr} if bmsr


      end



      roundtrip_requests = requests.to_a.product reverse_requests.to_a

      one_way = []
      # if requests.count > 1
      #   byebug
      # end
      # TODO: Maybe the 'journeys' object should be created outside of the requests.each. loop

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
