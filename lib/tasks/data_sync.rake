namespace :data_sync do

	desc 'load standard air_sched airlines'
	task :airlines => :environment do |t, args|


		tf = Tempfile.new(['air_sched_airlines', 'csv'])
		File.open(File.join('lib', 'assets', 'air_sched_airlines.csv')) do |lf|
				lf.each_line do |line|
					tf.write line
				end
			tf.rewind
			tf.close
		end

		uploaded_file = ActionDispatch::Http::UploadedFile.new(
		        tempfile:  tf,
		        filename:  'air_sched_airlines.csv',
		        type:  'text/csv',
		        head:  '')

		ai_model = ActiveAdminImport::Model.new
		ai_model.file = uploaded_file
		options = {
		 :csv_options=>{:col_sep=>","},
		 :template=>"admin/import",
		 :resource_class=>	Airline,
		 :resource_label=>"Airline",
		 :plural_resource_label=>"Airlines",
		 :headers_rewrites=>{},
		 :validate=>false,
		 :batch_size=>1000,
		 :before_import => proc{ Airline.delete_all},
		 :template_object=>{
		     :csv_headers=>[],
		     :allow_archive=>true,
		     :force_encoding=>"UTF-8"}
		 }
		 importer = ActiveAdminImport::Importer.new(options[:resource_class], ai_model, options)

		 importer.import

	end

	desc 'load standard air_sched airports'
	task :airports => :environment do |t, args|


		tf = Tempfile.new(['air_sched_airports', 'csv'])
		File.open(File.join('lib', 'assets', 'air_sched_airports.csv')) do |lf|
				lf.each_line do |line|
					tf.write line
				end
			tf.rewind
			tf.close
		end

		uploaded_file = ActionDispatch::Http::UploadedFile.new(
		        tempfile:  tf,
		        filename:  'air_sched_airports.csv',
		        type:  'text/csv',
		        head:  '')

		ai_model = ActiveAdminImport::Model.new
		ai_model.file = uploaded_file
		options = {
		 :csv_options=>{:col_sep=>","},
		 :template=>"admin/import",
		 :resource_class=>	Airport,
		 :resource_label=>"Airport",
		 :plural_resource_label=>"Airports",
		 :headers_rewrites=>{},
		 :validate=>false,
		 :batch_size=>1000,
		 :before_import => proc{ Airport.delete_all},
		 :template_object=>{
		     :csv_headers=>[],
		     :allow_archive=>true,
		     :force_encoding=>"UTF-8"}
		 }
		 importer = ActiveAdminImport::Importer.new(options[:resource_class], ai_model, options)

		 importer.import


	end

  desc 'Get lat and long for each airport'
  task :refresh_lat_long => :environment do |t, args|

	require 'csv'


 	airports = {}

	File.foreach(File.join('lib', 'assets', 'global_airports.csv')) do |csv_line|
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












