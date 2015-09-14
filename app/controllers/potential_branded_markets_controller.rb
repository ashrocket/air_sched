class PotentialBrandedMarketsController < ApplicationController
  before_action :set_potential_branded_market, only: [:show, :edit, :update, :destroy]

  # GET /potential_branded_markets
  def index
    @potential_branded_markets = PotentialBrandedMarket.all
  end

  # GET /potential_branded_markets/1
  def show
  end

  # GET /potential_branded_markets/new
  def new
    @potential_branded_market = PotentialBrandedMarket.new
  end

  # GET /potential_branded_markets/1/edit
  def edit
  end

  # POST /potential_branded_markets
  def create
    @potential_branded_market = PotentialBrandedMarket.new(potential_branded_market_params)

    if @potential_branded_market.save
      redirect_to @potential_branded_market, notice: 'Potential branded market was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /potential_branded_markets/1
  def update
    if @potential_branded_market.update(potential_branded_market_params)
      redirect_to @potential_branded_market, notice: 'Potential branded market was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /potential_branded_markets/1
  def destroy
    @potential_branded_market.destroy
    redirect_to potential_branded_markets_url, notice: 'Potential branded market was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potential_branded_market
      @potential_branded_market = PotentialBrandedMarket.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def potential_branded_market_params
      params.require(:potential_branded_market).permit(:origin, :dest, :brand_id)
    end
end
