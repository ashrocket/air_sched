module Admin
class ABBConfigsController < ApplicationController
  #
  # TODO: remove unscoped create and update from here, and move views to
  # support ActiveAdmin controller only.
  # this controller should be for user attached settings only.
  #
  def index
    # to get all items for render list
    @abb_configs = ABBConfig.unscoped
  end

  def edit
    @abb_config = ABBConfig.unscoped.find(params[:id])
  end

  def index
    @abb_configs  = Setting.unscoped.all
  end
  #
  #def edit
  #  @setting = Setting.find(params[:id])
  #  @setting[:value] = YAML.load(@setting[:value])
  #end
  def new
    @abb_config = ABBConfig.unscoped.new(var: '', value: '')

  end
  def create
    abb_config = params.fetch(:abb_config)
    ABBConfig.unscoped[abb_config['var']] = abb_config['value']
    @abb_config       = ABBConfig.unscoped.find_by(var: abb_config['var'])
    @abb_config.tip   = abb_config['tip']

    respond_to do |format|
    format.json{
      if @abb_config.save
        render json: @abb_config, status: :accepted, location: admin_app_setting_path(@abb_config)

      else
        render json: @abb_config.errors, status: :unprocessable_entity
      end
    }
    format.html{
      if @abb_config.save
        redirect_to admin_app_setting_path(@abb_config), notice: 'Saved.'
      else
        render 'create'
      end
    }
    end
  end

  def update

    @abb_config = ABBConfig.unscoped.find(params[:id])
    @abb_config.var = params[:abb_config][:var]
    @abb_config.value = params[:abb_config][:value]
    @abb_config.tip = params[:abb_config][:tip] if params[:abb_config][:tip]

    respond_to do |format|
      format.json{
        if @abb_config.save
          render json: @abb_config, status: :accepted, location: edit_admin_app_setting_path(@abb_config)

        else
          render json: @abb_config.errors, status: :unprocessable_entity
        end
      }
      format.html{
        if @abb_config.save
          redirect_to admin_app_settings_path, notice: 'Saved.'
        else
          render 'edit'
        end
      }
    end

  end

end
end