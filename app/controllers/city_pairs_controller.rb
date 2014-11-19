class CityPairsController < ApplicationController

  respond_to :json

  def show
    @city_pair = PossibleFlight.where(
      hub: "#{ABBConfig.data_key}", 
      orig: "#{params['id']}", 
      dest: "#{params['orig']}"
    ).first
  end


end
