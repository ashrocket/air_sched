ActiveAdmin.register AppControl do
  menu priority: 3,  :parent => 'Settings'
  actions :all, except: [ :new, :destroy]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :report_key_id, :brand_id



  controller do
      # def index
      #   @hosts = Host.all
      #   render :index,  layout: 'active_admin'
      # end
      def index
        @app_control = AppControl.first
        redirect_to [:admin, @app_control]
      end
      def edit
        @app_control = AppControl.first
        render :edit,  layout: 'active_admin'
      end
      def show
        @app_control = AppControl.first
         render :show,  layout: 'active_admin'
      end
      #
      # def update
      #   @singly = AppControl.singleton
      #   @singly.update(permitted_params[:app_control])
      # end
  end
end