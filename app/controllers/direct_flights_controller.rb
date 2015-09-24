class DirectFlightsController < ApplicationController
  #before_action :set_direct_flight, only: [:show, :edit, :update, :destroy]
  before_action :set_direct_flight, only: [:show]


  # GET /direct_flights
  def index
    @direct_flights = DirectFlight.keyed(ReportKey.current_key)
  end

  # GET /direct_flights/1
  def show
  end

  def explore
    # @direct_flights = DirectFlight.keyed(ReportKey.current_key)
    @origins =   DirectFlight.origins
    @origins =   @origins.to_a.sort_by!(&:name)
  end

  # GET /connections/from/airport_code JSON Only
  def from
    @airport_code = params[:origin]
    @dest_apts = Airport.where(code:
                       DirectFlight.keyed(ReportKey.current_key)
                           .dest_from_origin(@airport_code)
    ).select(:code, :name, :id)
    .map{|a| {dest: a.code, dest_name: a.name, dest_airport_id: a.id }}



  end

  ## GET /direct_flights/new
  #def new
  #  @direct_flight = DirectFlight.new
  #end
  #
  ## GET /direct_flights/1/edit
  #def edit
  #end
  #
  ## POST /direct_flights
  #def create
  #  @direct_flight = DirectFlight.new(direct_flight_params)
  #
  #  if @direct_flight.save
  #    redirect_to @direct_flight, notice: 'DirectFlight was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end
  #
  ## PATCH/PUT /direct_flights/1
  #def update
  #  if @direct_flight.update(direct_flight_params)
  #    redirect_to @direct_flight, notice: 'DirectFlight was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end
  #
  ## DELETE /direct_flights/1
  #def destroy
  #  @direct_flight.destroy
  #  redirect_to direct_flights_url, notice: 'DirectFlight was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direct_flight
      @direct_flight = DirectFlight.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def direct_flight_params
      params[:direct_flight]
    end
end
