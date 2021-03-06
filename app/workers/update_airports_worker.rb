# app/workers/update_airports_worker.rb

class UpdateAirportsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker
  include Sidetiq::Schedulable
  recurrence { daily }

  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true

  sidekiq_options lock: {
        timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },      # you don't use user_id here thus the naming
        name:    "lock:updateairports"  # no need to pass timeout - not used
      }


  def perform
    Rails.logger = Sidekiq::Logging.logger
    Rails.logger.info 'UpdateAirportsWorker Checking for lock and AppSwitch'
    if  AppSwitch.on?('update_airports')
      if lock.acquire!
        begin
        airports = {}

     	File.foreach(File.join('lib', 'assets', 'global_airports.csv')) do |csv_line|
     		escaped_text = csv_line.gsub('\'', '""')
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
      log_data = []
     	Airport.all.sort_by(&:code).each do |db_airport|
        code = db_airport.code.upcase
     		found_airport = airports[code]
     		if found_airport
          log_data << found_airport.inspect
     			db_airport.update_columns(:lat => found_airport[:lat], :long => found_airport[:long])
     		else
          log_data <<  "------------------------------------NOT found #{code}"
     		end
     	end
      ensure
        log_data.each do |line|
          Sidekiq::Logging.logger.info line
        end
        lock.release!
      end
      end
    end
    #Do Something here with the message
    #
  end
end