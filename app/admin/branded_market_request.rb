ActiveAdmin.register BrandedMarketRequest do
  menu priority: 6, label: 'Market Requests', :parent => 'Data'

  filter :origin, filters: [:cont, :eq, :start, :end]
  filter :dest, filters: [:cont, :eq, :start, :end]
  filter :seg_count, filters: [:cont, :eq, :start, :end]
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
         @branded_market_request = BrandedMarketRequest.find(params[:id])
          render :show,  layout: 'active_admin'
        end

   end

end
