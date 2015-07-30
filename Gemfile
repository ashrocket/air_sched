source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1'
# ORM related gems
gem 'pg', '~> 0.18.0.pre20140820094244'
gem 'postgres_ext'
gem 'arel-helpers'
# gem 'mysql2'
gem 'friendly_id', '~> 5.0.0'
gem 'activerecord-import'
gem 'date_validator'
gem 'chronic'
gem 'time_diff'
# gem 'mail', '2.6.1'

# Template language gems
# Use SCSS for stylesheets
gem 'js-routes'
gem 'coffee-rails', '~> 4.0'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'sass-rails', '~> 4.0'
gem 'quiet_assets', :group => :development
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'


# Use jquery as the JavaScript library
# Using Bower, so only customized asset gems are required in here
#gem 'bootstrap-datepicker-rails'

#View based gems
gem 'simple_form'
gem 'css3-progress-bar-rails'



gem 'rack-cors', :require => 'rack/cors'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#gem 'spring',        group: :development

gem 'figaro'
gem 'aws-sdk'
gem 'redis-objects', '~> 0.9'
gem 'sidekiq', '2.17.7'
gem 'sidekiq-lock'
gem 'sidekiq-failures'
gem 'sinatra', '>= 1.3.0', :require => nil
gem 'sidetiq', '0.5.0'
gem 'rabl'

gem 'parallel'

gem 'devise', :git => 'https://github.com/plataformatec/devise.git'
#gem 'devise', '3.2.4'
gem 'activeadmin', github: 'activeadmin'
# gem 'activeadmin'
# gem 'inherited_resources', github: 'josevalim/inherited_resources', branch: 'rails-4-2'
#gem 'activeadmin', github: 'gregbell/active_admin'


# gem 'active_admin_import' , '>= 2.1.2'
gem 'active_admin_import'

gem "rails-settings-cached", "0.4.1"
gem 'roo'


# gem 'mastiff', :git => 'https://github.com/ashrocket/mastiff.git'
gem 'mastiff', path: '../mastiff'


group :development, :test do
    gem 'better_errors'
    gem 'binding_of_caller'
    gem 'byebug'
    #gem 'debugger', group: [:development, :test]
    gem 'rspec',  '~> 3.0.0.beta2'
    gem 'rspec-rails',  '~> 3.0.0.beta2'


    gem 'cucumber'
    gem 'cucumber-rails', :require=>false
    gem "factory_girl_rails"


end
