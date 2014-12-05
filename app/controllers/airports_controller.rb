class AirportsController < ApplicationController

 #def show
 #  is_int = Integer(params[:id]) rescue nil
 #  if is_int
 #    @airport = Airport.find(params[:id])
 #  else
 #    @airport = Airport.friendly.find(params[:id])
 #  end
 #end
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


  def airports
    query = params[:query]
    @airports = Destination.origins
    @airports = @airports.to_a.sort_by!(&:name)
    render 'origins'
  end

  def show    
    @airport_code = params[:id]
    cnx_pairs = CnxPair.keyed(ABBConfig.data_key).from_airport(@airport_code)
    @cnx_pairs = cnx_pairs.map{|pair| pair.slice(:dest, :dest_name).merge(
      :dest_airport_id =>  Airport.friendly.find(pair.dest.downcase).id,
      :lat =>  Airport.friendly.find(pair.dest.downcase).lat,
      :long =>  Airport.friendly.find(pair.dest.downcase).long)}
    @cnx_pairs.each{|h| 
      h[:dest_name] = h[:dest_name].sub(' 00', '')
      h.store('value',h.delete('dest_name'))
    }
    render 'cnx_pairs/show'
  end


end