ActiveAdmin.register Destination do
  # filter :cxrs1_contains, as: :select, multiple: true
  menu :parent => "Connections"

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
    column :origin_code
    column :cxrs1
    column :hub_name
    column :hub_code
    column :cxrs2
    column :dest
    column :dest_code
    column :eff_days do |dest|
      JSON.parse(dest.eff_days.first)
    end
  end

end
