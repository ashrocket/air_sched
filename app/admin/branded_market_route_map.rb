ActiveAdmin.register BrandedMarketRouteMap do
  menu priority: 7, label: 'Market Route Maps', :parent => 'Data'
  filter :brand
  filter :origin, filters: [:cont, :eq, :start, :end]
  filter :dest, filters: [:cont, :eq, :start, :end]
  actions :all, :except => [:new, :edit, :destroy]


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
  index do
          column :brand do |branded_market_route_map|
            content_tag :ul, class: 'list-group' do
              content_tag(:li, class: 'list-group-item') do
                 link_to(branded_market_route_map.brand.name, admin_brand_path(branded_market_route_map.brand))
              end
            end
          end
          column :id
          column :route_map

          actions
  end

  controller do
         # def index
         #   @hosts = Host.all
         #   render :index,  layout: 'active_admin'
         # end
         def show
           @branded_market_route_map = BrandedMarketRouteMap.find(params[:id])
            render :show,  layout: 'active_admin'
          end

   end

end
