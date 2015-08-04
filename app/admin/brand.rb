ActiveAdmin.register Brand, as: 'Brands' do
  menu priority: 3,  :parent => 'Config'


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :report_keys, :name,  :description, :active
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  form do |f|
      f.inputs do
        f.input :brand_key
        f.input :name
        f.input :report_keys, as: :text
        f.input :description
        f.input :host_map, as: :text
        f.input :active
        f.input :default_currency
      end
      f.actions
  end

end
