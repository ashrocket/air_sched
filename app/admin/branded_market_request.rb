ActiveAdmin.register BrandedMarketRequest do
  menu priority: 6, label: 'Market Requests', :parent => 'Data'

  filter :origin, filters: [:cont, :eq, :start, :end]
  filter :dest, filters: [:cont, :eq, :start, :end]
  filter :seg_count
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

  index do
         column :brand
         column :id
         column :origin
         column :dest
         column :seg_count
         column :details do |bmr|
           content_tag :ul, class: 'list-group' do
                bmr.branded_route_requests.collect{ |brr|
                    content_tag(:li, class: 'list-group-item') do
                      link_to("#{brr.key}  (#{brr.id})", [:admin,brr])
                        end
                      }.join.html_safe
           end
         end
         actions
   end


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
