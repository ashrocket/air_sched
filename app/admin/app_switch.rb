ActiveAdmin.register AppSwitch do
  menu priority: 3,  :parent => 'Settings'


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :enabled, :id
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  # form do |f|
  #     f.inputs 'App Switch' do
  #         f.input :name, as: :string, input_html:{ type: 'string', size: 64 }
  #         f.input :enabled
  #     end
  #     f.actions
  # end

  controller do
     # def index
     #   @hosts = Host.all
     #   render :index,  layout: 'active_admin'
     # end
     def edit
       @app_switch = AppSwitch.find(params[:id])
       render :edit,  layout: 'active_admin'
     end
     def show
       @app_switch = AppSwitch.find(params[:id])
        render :show,  layout: 'active_admin'
      end

     def new
       @app_switch = AppSwitch.new
       render :new,  layout: 'active_admin'
     end
  end

end
