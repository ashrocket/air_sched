class CityPairsController < ApplicationController

  respond_to :json

  def show
    @city_pair = CityPair.search(params)
  end


end
