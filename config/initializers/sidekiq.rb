Sidekiq.configure_server do |config|
  # database_url = ENV['DATABASE_URL']
  # if database_url
    # ENV['DATABASE_URL'] = "#{database_url}?pool=25"
  defined?(ActiveRecord::Base) and
           ActiveRecord::Base.establish_connection(
             Rails.application.config.database_configuration[Rails.env]
         )
  # end
end