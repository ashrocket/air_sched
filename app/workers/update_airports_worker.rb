# app/workers/process_attachment_worker.rb
class UpdateAirportsWorker
  include Sidekiq::Worker
  include Sidekiq::Lock::Worker
  include Sidetiq::Schedulable
  recurrence { minutely }

  sidekiq_options :queue => :email_queue, :retry => false, :backtrace => true

  sidekiq_options lock: {
        timeout: proc { |_, timeout = 1_200_000 | timeout * 2 },      # you don't use user_id here thus the naming
        name:    proc { |message_id| "lock:updateairports" } # no need to pass timeout - not used
      }


  def perform()
    Rails.logger = Sidekiq::Logging.logger
    if lock.acquire!
    begin
      airports = {}

     	File.foreach(File.join('lib', 'assets', 'airports.csv')) do |csv_line|
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
      ensure
        lock.release!
      end
    else
      Sidekiq::Logging.logger.info "Update Airports Worker, busy, delaying  for 1 minute"
      UpdateAirportsWorker.delay_for(2.minute).perform_async()
    end
    #Do Something here with the message
    #
  end
end