require 'net/imap'
#require 'zipruby'
require 'zip'


module Oag
  module Util

  extend self



    def uncompress_report archive_path, tmpfile_path
      Zip::InputStream::open(archive_path) {|io|
          entry = io.get_next_entry
          File.open( tmpfile_path, 'wb'){|f| f << io.read}
      }
    end

    def compress_report archive_path, tmpfile_path
      Zip::File.open(archive_path, Zip::File::CREATE) do |zipfile|
          zipfile.add(File.basename(tmpfile_path), tmpfile_path)
      end
    end


  def release_forked_process_postgres_db_connection
      begin
        defined?(ActiveRecord::Base) and
                ActiveRecord::Base.connection.disconnect!
      rescue Exception => ex
        Rails.logger.info ex.message
      end
  end


    # As per https://github.com/grosser/parallel  Active Record Connection
    # https://devcenter.heroku.com/articles/forked-pg-connections
    def refresh_forked_process_postgres_db_connection
      begin
        begin
        ActiveRecord::Base.connection.reconnect!
        # defined?(ActiveRecord::Base) and
        #    ActiveRecord::Base.establish_connection(
        #      Rails.application.config.database_configuration[Rails.env]
        #  )
        rescue Exception => ex
          Rails.logger.info ex.message
          ActiveRecord::Base.connection.reconnect!
        end
      rescue
        Rails.logger.info ex.message
      end
    end


  end
end
