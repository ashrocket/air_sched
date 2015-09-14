class PotentialBrandedJourneysController < ApplicationController
  before_action :set_potential_branded_journey, only: [:show, :edit, :update, :destroy]

  # GET /potential_branded_journeys
  def index
    @potential_branded_journeys = PotentialBrandedJourney.all
  end

  # GET /potential_branded_journeys/1
  def show
  end

  # GET /potential_branded_journeys/new
  def new
    @potential_branded_journey = PotentialBrandedJourney.new
  end

  # GET /potential_branded_journeys/1/edit
  def edit
  end

  # POST /potential_branded_journeys
  def create
    @potential_branded_journey = PotentialBrandedJourney.new(potential_branded_journey_params)

    if @potential_branded_journey.save
      redirect_to @potential_branded_journey, notice: 'Potential branded journey was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /potential_branded_journeys/1
  def update
    if @potential_branded_journey.update(potential_branded_journey_params)
      redirect_to @potential_branded_journey, notice: 'Potential branded journey was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /potential_branded_journeys/1
  def destroy
    @potential_branded_journey.destroy
    redirect_to potential_branded_journeys_url, notice: 'Potential branded journey was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potential_branded_journey
      @potential_branded_journey = PotentialBrandedJourney.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def potential_branded_journey_params
      params.require(:potential_branded_journey).permit(:journey, :segments, :potential_branded_market_id)
    end
end
