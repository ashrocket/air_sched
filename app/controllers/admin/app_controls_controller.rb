class AppControlsController < ApplicationController
  before_action :set_app_control, only: [:show, :edit, :edit_current_data_key, :update]

  # GET /app_controls

  # GET /app_controls/1
  def show
  end


  # GET /app_controls/1/edit
  def edit
  end

    # GET /app_controls/1/edit
  def edit_current_data_key
  end
   # GET /app_controls/1/edit
  def set_current_data_key
    if @app_control.update(app_control_params)
      redirect_to @app_control, notice: 'App control was successfully updated.'
    else
      render :edit_current_data_key
    end
  end

  # PATCH/PUT /app_controls/1
  def update
    if @app_control.update(app_control_params)
      redirect_to @app_control, notice: 'App control was successfully updated.'
    else
      render :edit
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_control
      @app_control = AppControl.first
    end

    # Only allow a trusted parameter "white list" through.
    def app_control_params
      params.require(:app_control).permit(:report_key_id)
    end
end
