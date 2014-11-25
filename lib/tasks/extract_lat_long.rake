namespace :extract do

  desc "Get lat and long for each airport"
  task :lat_long => :environment do |t, args|

  	require 'csv'

 	Dir.chdir(File.dirname(__FILE__))

 	airports = {}

	File.foreach('airports.csv') do |csv_line|
		escaped_text = csv_line.gsub('\"', '""')
		row = CSV.parse(escaped_text, :col_sep => ',', :row_sep => :auto).first

		if row[4] != ''
			airport = {
				:code => row[4],
				:lat => row[6],
				:long => row[7]
			}

			airports[row[4].upcase] = airport
		end
	end

	Airport.all.each do |db_airport|
		code = db_airport.code.upcase
		found_airport = airports[code]
		if found_airport
			puts found_airport.inspect
			puts ""
			db_airport.update_columns(:lat => found_airport[:lat], :long => found_airport[:long])
		else
			puts "------------------------------------NOT found #{code}"
		end

	end

  end

end












