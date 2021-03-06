ActiveAdmin.register Airport do
  menu :parent => "Codes"


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :code, :name, :city

  index do
    column :code
    column :name
    column :city
    actions
  end

  active_admin_import :validate => false,
                      :csv_options => {:col_sep => "," },
                      :before_import => proc{ Airport.delete_all},
                      :batch_size => 1000
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end


end
