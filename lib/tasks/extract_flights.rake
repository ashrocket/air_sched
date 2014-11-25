namespace :extract do

	desc "Extracts the possible journeys for city pair for next 180 days"
	task :flights => :environment do |t, args|

		pf = CityPairJourneysFinder.new
		pf.all

 	end
end    
