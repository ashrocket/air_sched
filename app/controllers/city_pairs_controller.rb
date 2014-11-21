class CityPairsController < ApplicationController

  respond_to :json

  def show
    @city_pair = PossibleFlight.where(
      hub: "#{ABBConfig.data_key}", 
      orig: "#{params['id']}", 
      dest: "#{params['orig']}"
    ).first


    fparams = {
      "origin_code" => params['id'],
      "dest_code" => params['orig'],
      "depart" => params['dest'],
      "return" => params['leave_date']
    }

    pf = PossibleFlights.new
    @city_pair.journies = pf.find_with_params(fparams)
  end


end
