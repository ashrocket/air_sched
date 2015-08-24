class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  def index
    @hosts = Host.all
  end

  # GET /hosts/1
  def show
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
  end

  # POST /hosts
  def create
    @host = Host.new(host_params)

    if @host.save
      redirect_to @host, notice: 'Host was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hosts/1
  def update
    if @host.update(host_params)
      redirect_to @host, notice: 'Host was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hosts/1
  def destroy
    @host.destroy
    redirect_to hosts_url, notice: 'Host was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def host_params
      params.require(:host).permit(:name, :code, airline_ids: [])
    end
end
