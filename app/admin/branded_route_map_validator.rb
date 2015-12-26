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
        validator.implied_market.brand.name
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
  
  

end
