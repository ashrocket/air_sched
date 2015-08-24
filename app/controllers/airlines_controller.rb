class AirlinesController < ApplicationController
  before_action :set_airline, only: [:show, :edit, :update, :destroy]

  # GET /airlines
  def index
    @airlines = Airline.all
  end

  # GET /airlines/1
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airline
      @airline = Airline.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def airline_params
      params.require(:host).permit(:name, :code, :country_name, hosts_ids: [])
    end
    # Use callbacks to share common setup or constraints between actions.
end
