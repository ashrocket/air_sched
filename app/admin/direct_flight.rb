ActiveAdmin.register DirectFlight, :as => "Directs" do
  menu :parent => "Data"

  
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
