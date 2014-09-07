class Admin::ABBConfigController < ApplicationController
  def index
    # to get all items for render list
    @abb_configs = ABBConfig.unscoped
  end

  def edit
    @abb_config = ABBConfig.unscoped.find(params[:id])
  end

  #def index
  #  @settings = Setting.thing_scoped.all
  #end
  #
  #def edit
  #  @setting = Setting.find(params[:id])
  #  @setting[:value] = YAML.load(@setting[:value])
  #end

  def update

    @abb_config = ABBConfig.unscoped.find(params[:id])
    @abb_config.var = params[:abb_config][:var]
    @abb_config.value = params[:abb_config][:value]
    @abb_config.tip = params[:abb_config][:tip] if params[:abb_config][:tip]

    respond_to do |format|
      format.json{
        if @abb_config.save
          render json: @abb_config, status: :accepted, location: edit_tuning_abb_config_path(@abb_config)

        else
          render json: @abb_config.errors, status: :unprocessable_entity
        end
      }
      format.html{
        if @abb_config.save
          redirect_to tuning_abb_config_index_path, notice: "Saved."
        else
          render "edit"
        end
      }
    end

  end

end