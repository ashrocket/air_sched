# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ABBConfig.data_key = 'SNN'
config = ABBConfig.where(:var => 'data_key').first
config.tip = "Key that determins which data set will be used"
config.save

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
