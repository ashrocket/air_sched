ActiveAdmin.register Airline do
  menu :parent => "Codes"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :code, :name, :country

  index do
    column :code
    column :name
    actions
  end

  active_admin_import :validate => false,
                      :csv_options => {:col_sep => "," },
                      :before_import => proc{ Airline.delete_all},
                      :batch_size => 1000





end
