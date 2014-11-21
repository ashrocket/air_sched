namespace :extract do

	desc "Extracts the possible flights for each day of month"
	task :flights => :environment do |t, args|

		pf = PossibleFlights.new
		pf.find

 	end
end    
