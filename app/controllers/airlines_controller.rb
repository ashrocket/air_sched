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
end
