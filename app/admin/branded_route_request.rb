ActiveAdmin.register BrandedRouteRequest do
  menu priority: 5, label: 'Route Requests', :parent => 'Data'

  filter :origin, filters: [:cont, :eq, :start, :end]
  filter :dest, filters: [:cont, :eq, :start, :end]
  filter :cxrs, filters: [:cont, :eq, :start, :end]
  filter :host, filters: [:cont, :eq, :start, :end]
  filter :brand

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  controller do
       # def index
       #   @hosts = Host.all
       #   render :index,  layout: 'active_admin'
       # end
       def show
         @branded_route_request = BrandedRouteRequest.find(params[:id])
          render :show,  layout: 'active_admin'
        end

   end
end
