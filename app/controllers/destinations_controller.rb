class DestinationsController < ApplicationController
  #before_action :set_destination, only: [:show, :edit, :update, :destroy]
  before_action :set_destination, only: [:show]


  # GET /destinations
  def index
    @destinations = Destination.keyed(ReportKey.current_key)
  end

  # GET /destinations/1
  def show
  end

  def explore
  end

  def hubs
    data_key = ReportKey.current_key
    is_int = Integer(params[:origin]) rescue nil
    if is_int
      origin_apt = Airport.find(params[:origin])
      dest_apt   = Airport.find(params[:dest])
      hubs = Destination.hubs data_key, origin_apt.code,dest_apt.code
    else

      origin = params[:origin].upcase
      dest  =   params[:dest].upcase
      hubs = Destination.hubs data_key, origin, dest
    end
    @hubs = Airport.where(:code => hubs)
  end

  ## GET /destinations/new
  #def new
  #  @destination = Destination.new
  #end
  #
  ## GET /destinations/1/edit
  #def edit
  #end
  #
  ## POST /destinations
  #def create
  #  @destination = Destination.new(destination_params)
  #
  #  if @destination.save
  #    redirect_to @destination, notice: 'Destination was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end
  #
  ## PATCH/PUT /destinations/1
  #def update
  #  if @destination.update(destination_params)
  #    redirect_to @destination, notice: 'Destination was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end
  #
  ## DELETE /destinations/1
  #def destroy
  #  @destination.destroy
  #  redirect_to destinations_url, notice: 'Destination was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def destination_params
      params[:destination]
    end
end
