require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AirSched
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/lib)

    # config/application.rb
    # bootstrap-sass asset paths
    # root.join('vendor/assets/components/bootstrap-sass/assets').tap do |path|
    #   config.sass.load_paths << path.join('stylesheets')
    #   config.assets.paths += %w(javascripts fonts images).map(&path.method(:join))
    # end
    # byebug
    #

    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')


    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Use SQL instead of AR schema dumper when creating the database
    config.active_record.schema_format = :sql
  end
end
