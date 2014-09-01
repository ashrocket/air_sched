class AppConfig < RailsSettings::CachedSettings
# class AppConfig < ActiveRecord::Base
  self.table_name = 'settings'
end
