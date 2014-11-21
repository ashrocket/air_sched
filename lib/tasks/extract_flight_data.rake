namespace :extract do

	desc "Extracts the possible flight data"
	task :flight_data => :environment do |t, args|

		params = {
			"origin" => 'New York J F Kennedy International Apt',
			"origin_code" => 'JFK',
			"dest" => 'Manchester (GB)',
			"dest_code" => 'MAN',
			"depart" => '11-23-2014',
			"return" => '11-28-2014'
		}

		pf = PossibleFlights.new
		pf.find_with_params(params)

 	end
end    
