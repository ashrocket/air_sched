class AppSwitchesController < ApplicationController
  before_action :set_admin_app_switch, only: [:show, :edit, :update, :destroy]

  # GET /admin/app_switches
  def index
    @admin_app_switches = Admin::AppSwitch.all
  end

  # GET /admin/app_switches/1
  def show
  end

  # GET /admin/app_switches/new
  def new
    @admin_app_switch = Admin::AppSwitch.new
  end

  # GET /admin/app_switches/1/edit
  def edit
  end

  # POST /admin/app_switches
  def create
    @admin_app_switch = Admin::AppSwitch.new(admin_app_switch_params)

    if @admin_app_switch.save
      redirect_to @admin_app_switch, notice: 'App switch was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/app_switches/1
  def update
    if @admin_app_switch.update(admin_app_switch_params)
      redirect_to @admin_app_switch, notice: 'App switch was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/app_switches/1
  def destroy
    @admin_app_switch.destroy
    redirect_to admin_app_switches_url, notice: 'App switch was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_app_switch
      @admin_app_switch = Admin::AppSwitch.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_app_switch_params
      params.require(:admin_app_switch).permit(:name, :enable)
    end
end
