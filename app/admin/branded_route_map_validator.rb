ActiveAdmin.register BrandedRouteMapValidator do
  menu priority: 2, label: 'Market Validations', :parent => 'Validators'
  actions :all, :except => [:new, :edit, :destroy]
  # menu priority: 3, label: 'Validation Reports', parent: 'Reports'

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

      column 'Brand' do |validator|
          content_tag :ul, class: 'list-group' do
            content_tag(:li, class: 'list-group-item') do
               link_to(validator.implied_market.brand.name, admin_brand_path(validator.implied_market.brand))
            end
          end
      end
      column 'Origin' do |validator|
            validator.implied_market.origin
      end
      column 'Destination' do |validator|
            validator.implied_market.dest
      end
      column :route_map_counts
      column :route_map_structures



  end
  
  controller do
    def scoped_collection
      super.includes  :implied_market, implied_market: [:brand] # prevents N+1 queries to your database
    end
    def find_resource
      BrandedRouteMapValidator.where(id: params[:id]).first! # overrides resource retrieval to prevent eager loading
    end
  end

end
