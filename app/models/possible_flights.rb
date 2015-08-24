class PossibleFlights
	def initialize
		@start_time = Time.now

		@params = {  
			"data_key"=>"SNN", 
			"owrt"=>"RT", 
			"mct"=>"90", 
			"maxct"=>"1560", 
			"stops"=>"0"
		}
	end

	def find
		origins.each do |origin|
			destinations_from(origin).each do |dest|

				@params["origin_id"] = ''
				@params["origin"] = "#{origin['name']}"
				@params["origin_code"] = "#{origin['code']}"
				@params["dest_id"] = ''
				@params["dest"] = "#{dest['value']}"
				@params["dest_code"] = "#{dest['dest']}"
				puts @params.inspect
				puts ""
				puts ""

				@possible_flight_days_outbound = []
				@possible_flight_days_inbound = []
				@possible_flight_data = {:ob => [], :rt => []}

				find_flights
			end
		end
		puts "Finished in #{Time.now - @start_time} seconds"
	end

	def find_with_params(params)
		@params["origin_id"] = ''
		@params["origin"] = "#{params['orign']}"
		@params["origin_code"] = "#{params['origin_code']}"
		@params["dest_id"] = ''
		@params["dest"] = "#{params['dest']}"
		@params["dest_code"] = "#{params['dest_code']}"
		@params["depart"] = Date.parse("#{params['depart']}").strftime("%d-%m-%Y")
		@params["ret_date"] = Date.parse("#{params['return']}").strftime("%d-%m-%Y")
		puts @params.inspect
		puts ""
		puts ""

		@possible_flight_days_outbound = []
		@possible_flight_days_inbound = []
		@possible_flight_data = {:ob => [], :rt => []}

		find_flights_for_date(@params["depart"], @params["ret_date"])
		build_journies
		@journies
	end

	def origins
	    origs = Destination.origins
	    origs.to_a.sort_by!(&:name)
	    origs.select{|a| a.code == 'MAN'}
	end

	def destinations_from(origin)
		airport_code = origin.code
	    cnx_pairs = CnxPair.keyed(ReportKey.current_key).from_airport(airport_code)
	    destinations = cnx_pairs.map{|pair| pair.slice(:dest, :dest_name).merge(:dest_airport_id =>  Airport.friendly.find(pair.dest.downcase).id)}
	    destinations.each{|h| h.store('value',h.delete('dest_name'))}
	end

	def find_flights
		(1...180).each do |num|
			actual_date = Time.now + num.days
			@month = actual_date.month
			@day = actual_date.day
			date = (actual_date).strftime("%d-%m-%Y")

			find_flights_for_date(date, nil)
		end

		puts "#{@params['origin_code']}-#{@params['dest_code']} :: #{@possible_flight_days_outbound}"
		puts "#{@params['dest_code']}-#{@params['origin_code']} :: #{@possible_flight_days_inbound}"

		pf = PossibleFlight.where(
			hub: "#{@params['data_key']}", 
			orig: "#{@params['origin_code']}", 
			dest: "#{@params['dest_code']}"
		).first_or_create

		pf.update_columns(outbound: "#{@possible_flight_days_outbound.join(',')}", inbound: "#{@possible_flight_days_inbound.join(',')}")

	end

	def find_flights_for_date(date, rdate)
		@params["depart"] = "#{date}"
		@params["ret_date"] = "#{rdate}" if rdate

		@params[:data_key] = ReportKey.current_key unless @params[:data_key]
		search_request = SearchRequest.new(@params)
		
		search_results = OagSchedule.search_interlines search_request
		
		find_results search_results[:one_hub_trips], :ob
		find_results search_results[:one_hub_trips], :rt
	end

	def find_results(trips, way)
		results = trips[way]

		valids = results.select{|r| not r[:journeys][:f].blank?}

		valid_ids = []

		if valids.blank?
			puts "---------------------------------------------------> #{@params['depart']} - NO possible flights"
		else	
			valids.each do |hub_results|
				
				if hub_results[:journeys] and hub_results[:journeys][:f] and hub_results[:journeys][:f].count > 0
					hub_results[:journeys][:f].each do |flt|
						valid_ids = valid_ids + hub_results[:journeys][:xmap][flt.id]

						valid_ids.each do |x_id|
							valid_flt = hub_results[:journeys][:x].find{|x| x.id.eql? x_id}
							if valid_flt
								
								@possible_flight_data[way] << {
																:ob => extract_flight_data(flt),
																:ib => extract_flight_data(valid_flt)
															}
							end
						end
					end
				end
			end
			if valid_ids.empty?
				puts "---------------------------------------------------> #{@params['depart']} - NO possible flights"
			else
				puts "---------------------------------------------------> #{@params['depart']} - possible flights"
				if way == :ob
					@possible_flight_days_outbound << "#{@month}:#{@day}"
				else
					@possible_flight_days_inbound << "#{@month}:#{@day}"
				end
			end
		end
	end

	def extract_flight_data(flt)
		data = {
			:dep_date => flt.dep_date,
			:flight_num => flt.flight_num,
			:origin_apt => flt.origin_apt,
			:dep_time_local => flt.dep_time_local,
			:dest_apt => flt.dest_apt,
			:arr_time_local => flt.arr_time_local,
			:arr_date => flt.arr_date
		}
	end

	def build_journies
		@journies = []

		outbounds = @possible_flight_data[:ob]
		returns = @possible_flight_data[:rt]

		outbounds.each do |outbound|
			returns.each do |ret|
				#if (outbound[:ob][:arr_date] >= ret[:ib][:dep_date]) && (outbound[:ob][:arr_time_local] >= ret[:ib][:dep_time_local])
					@journies << build_journey(outbound, ret)
				#end
			end
		end
	end

	def build_journey(outbound, ret)
		journey = {
			:dep_start_date => outbound[:ob][:dep_date],
			:dep_end_date => outbound[:ib][:arr_date],
			:return_start_date => ret[:ob][:dep_date],
			:return_end_date => ret[:ob][:arr_date],
			:hub => @params["data_key"],
			:origin => @params["origin_code"],
			:dest => @params["dest_code"],
			:trips => build_trips(outbound, ret)
		}
	end

	def build_trips(outbound, ret)
		trips = []
		trips << {:segments => build_segments(outbound)} if outbound
		trips << {:segments => build_segments(ret)} if ret
		trips
	end

	def build_segments(trip)
		[trip[:ob], trip[:ib]]
	end

		

end






