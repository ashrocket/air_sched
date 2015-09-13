ActiveAdmin.register BrandConnection do
  menu priority: 1, label: 'Connections - Full', :parent => 'Data'


  filter :brand
  filter :origin, filters: [:cont, :eq, :start, :end]
  filter :via, filters: [:cont, :eq, :start, :end]
  filter :dest, filters: [:cont, :eq, :start, :end]
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


end
