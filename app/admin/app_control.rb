ActiveAdmin.register AppControl do
  menu priority: 3,  :parent => 'Config'
  actions :all, except: [ :new, :destroy]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :report_key



  controller do
      # def index
      #   @hosts = Host.all
      #   render :index,  layout: 'active_admin'
      # end
      def index
        @app_control = AppControl.first
        redirect_to [:admin,@app_control]
      end
      def edit
        @app_control = AppControl.first
        render :edit,  layout: 'active_admin'
      end
      def show
        @app_control = AppControl.first
         render :show,  layout: 'active_admin'
      end

      # def update
      #   @host = Host.find(params[:id])
      #   @host.update(permitted_params[:host])
      # end
  end
end