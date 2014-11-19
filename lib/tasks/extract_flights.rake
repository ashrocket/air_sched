namespace :extract do

	desc "Extracts the possible flights for each day of month"
	task :flights => :environment do |t, args|

		pf = PossibleFlights.new
		pf.find

 	end
end    


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
				find_flights
			end
		end
		puts "Finished in #{Time.now - @start_time} seconds"
	end

	def origins
	    origs = Destination.origins
	    origs.to_a.sort_by!(&:name)
	    origs.select{|a| a.code == 'MAN'}
	end

	def destinations_from(origin)
		airport_code = origin.code
	    cnx_pairs = CnxPair.keyed(ABBConfig.data_key).from_airport(airport_code)
	    destinations = cnx_pairs.map{|pair| pair.slice(:dest, :dest_name).merge(:dest_airport_id =>  Airport.friendly.find(pair.dest.downcase).id)}
	    destinations.each{|h| h.store('value',h.delete('dest_name'))}
	end

	def find_flights
		@possible_flight_days_outbound = []
		@possible_flight_days_inbound = []

		(1...180).each do |num|
			actual_date = Time.now + num.days
			@month = actual_date.month
			@day = actual_date.day
			date = (actual_date).strftime("%d-%m-%Y")

			@params["depart"] = "#{date}"

			@params[:data_key] = ABBConfig.data_key unless @params[:data_key]
		    search_request = SearchRequest.new(@params)

			search_results = OagSchedule.search_interlines search_request
			
			find_results search_results[:one_hub_trips], :ob
			find_results search_results[:one_hub_trips], :rt
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
end




