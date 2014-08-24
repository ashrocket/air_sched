class AirportsController < ApplicationController

  def show
    is_int = Integer(params[:id]) rescue nil
    if is_int
      @airport = Airport.find(params[:id])
    else
      @airport = Airport.friendly.find(params[:id])
    end
  end
  def origins
     query = params[:query]
     @airports = Destination.origins
     @airports = @airports.to_a.sort_by!(&:name)
  end
  def dest
    code = params[:id].upcase
    @airports = Destination.dest_airports code
    @airports = @airports.to_a.sort_by!(&:name)
  end
end