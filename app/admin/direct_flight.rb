ActiveAdmin.register DirectFlight do
  menu priority: 0, label: 'Directs', :parent => 'Data'


  filter :report_key
  filter :origin, filters: [:cont, :eq, :start, :end]
  filter :dest, filters: [:cont, :eq, :start, :end]
  filter :carriers

  # See permitted parameters documentation:
  # https://github.com/gregbell/admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  index do
    column :report_key
    column :origin
    column :dest
    column :carriers
  end

end
