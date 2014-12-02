class CityPair < ActiveRecord::Base
  
  attr_accessor :journeys, :one_way

  def self.search(params)
  	city_pair = CityPair.where(
      hub: "#{ABBConfig.data_key}", 
      orig: "#{params['id']}", 
      dest: "#{params['orig']}"
    ).first

  	return unless city_pair

    fparams = {
      "origin_code" => params['id'],
      "dest_code" => params['orig'],
      "depart" => params['dest'],
      "return" => params['leave_date']
    }

    finder = CityPairJourneysFinder.new
    city_pair.journeys = finder.find(fparams)
    city_pair.one_way = fparams['return'].blank?
    city_pair
  end
end
