class PotentialBrandedCarriersController < ApplicationController
  before_action :set_potential_branded_carrier, only: [:show, :edit, :update, :destroy]

  # GET /potential_branded_carriers
  def index
    @potential_branded_carriers = PotentialBrandedCarrier.all
  end

  # GET /potential_branded_carriers/1
  def show
  end

  # GET /potential_branded_carriers/new
  def new
    @potential_branded_carrier = PotentialBrandedCarrier.new
  end

  # GET /potential_branded_carriers/1/edit
  def edit
  end

  # POST /potential_branded_carriers
  def create
    @potential_branded_carrier = PotentialBrandedCarrier.new(potential_branded_carrier_params)

    if @potential_branded_carrier.save
      redirect_to @potential_branded_carrier, notice: 'Potential branded carrier was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /potential_branded_carriers/1
  def update
    if @potential_branded_carrier.update(potential_branded_carrier_params)
      redirect_to @potential_branded_carrier, notice: 'Potential branded carrier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /potential_branded_carriers/1
  def destroy
    @potential_branded_carrier.destroy
    redirect_to potential_branded_carriers_url, notice: 'Potential branded carrier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potential_branded_carrier
      @potential_branded_carrier = PotentialBrandedCarrier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def potential_branded_carrier_params
      params.require(:potential_branded_carrier).permit(:cxr, :carrier_name, :brand_id)
    end
end
