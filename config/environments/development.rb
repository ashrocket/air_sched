Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  # config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  #config.action_mailer.delivery_method = :letter_opener
  #config.action_mailer.delivery_method = :sendmail
  config.action_mailer.delivery_method = :smtp
  
  # config.action_mailer.default_url_options = { :host => "localhost:3000" }
  # ActionMailer::Base.smtp_settings = {
  #       :address              => "smtp.gmail.com",
  #       :port                 => 587,
  #       :user_name      => ENV['GMAIL_USERNAME'],
  #       :password       => ENV['GMAIL_PASSWORD'],
  #       :domain       => ENV['GMAIL_DOMAIN'],
  #       :authentication       => "plain",
  #       :enable_starttls_auto => true
  #     }

  # config.action_controller.asset_host = '0.0.0.0:3000'
  # config.action_mailer.default_url_options = { :host => '0.0.0.0:3000' }
  # config.action_mailer.asset_host = '0.0.0.0:3000'

  ActionMailer::Base.smtp_settings = {
      :address              => "0.0.0.0",
      :port                 => 25
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  # config.assets.debug = false
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  #Sidekiq.default_worker_options = { :queue => :schedule_loader }

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true


  # Require all existing scheduled jobs
  Dir[Rails.root.join "app/workers/**/*.rb"].each { |f| require f }

  # config.application_url = 'http://0.0.0.0'
  # config.application_port = '3000'


  Mastiff.configure do |config|
    config.attachment_dir    = "/tmp"
  end

  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    # Bullet.growl = true
    Bullet.rails_logger = true
    # Bullet.honeybadger = true
    # Bullet.bugsnag = true
    # Bullet.airbrake = true
    # Bullet.rollbar = true
    Bullet.add_footer = true
    # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
    Bullet.slack = { webhook_url: 'https://hooks.slack.com/services/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', source: 'bullet' }
  end
end
