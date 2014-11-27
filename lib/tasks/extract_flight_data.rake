namespace :extract do

	desc "Extracts the possible journeys data for the city pair and params"
	task :flight_data => :environment do |t, args|

		params = {
			"origin" => 'New York J F Kennedy International Apt',
			"origin_code" => 'JFK',
			"dest" => 'Manchester (GB)',
			"dest_code" => 'MAN',
			"depart" => '29-Nov-2014',
			"return" => '11-Dec-2014'
		}

		pf = CityPairJourneysFinder.new
		pf.find(params)

 	end
end    