# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ac = AppControl.first_or_create!

rk = ReportKey.where(name: 'Null Report', report_key: 'NONE').first_or_create
ReportKey.set_current(rk)

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

AppSwitch.where(name: 'autoload').first_or_create!
