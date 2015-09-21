class CnxPairsController < ApplicationController


  # GET /cnx_pairs/airport_code JSON Only
  def show
    @airport_code = params[:id]
    cnx_pairs = CnxPair.keyed(ReportKey.current_key).from_airport(@airport_code)

    @cnx_pairs = cnx_pairs.map{|pair| pair.slice(:dest, :dest_name).merge(:dest_airport_id =>  Airport.friendly.find(pair.dest.downcase).id)}

  end
  # GET /connections/from/airport_code JSON Only
  def from
    @airport_code = params[:origin]
    @cnx_pairs = CnxPair.keyed(ReportKey.current_key).from_airport(@airport_code)
                     .select(:dest, :dest_name, :dest_airport_id)
                     .map{|cp| cp.attributes.except('id')}
  end

  private
    # Only allow a trusted parameter "white list" through.
    def cnx_pair_params
      params[:cnx_pair]
    end
end
