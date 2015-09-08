# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AppControl.first_time_setup

au = AdminUser.where(email: 'admin@example.com').first
unless au
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

ABBConfig.mct = 60
config = ABBConfig.where(:var => 'mct').first
config.tip = "in minutes"
config.save

ABBConfig.maxct = 1560
config = ABBConfig.where(:var => 'maxct').first
config.tip = "in minutes"
config.save

ABBConfig.maxmaxct = 2880
 config = ABBConfig.where(:var => 'maxmaxct').first
 config.tip = "in minutes"
 config.save

AppSwitch.where(name: 'autoload_oag').first_or_create!
AppSwitch.where(name: 'autogenerate_routemaps').first_or_create!

