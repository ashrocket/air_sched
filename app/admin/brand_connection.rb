ActiveAdmin.register BrandConnection do
  menu priority: 1, label: 'Connections - Full', :parent => 'Data'


  filter :brand
  filter :origin, filters: [:cont, :eq, :start, :end]
  filter :via, filters: [:cont, :eq, :start, :end]
  filter :dest, filters: [:cont, :eq, :start, :end]
  filter :sched1_cxr, filters: [:cont, :eq, :start, :end]
  filter :sched2_cxr, filters: [:cont, :eq, :start, :end]

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
    column :brand do |brand_connection|
        content_tag :ul, class: 'list-group' do
          content_tag(:li, class: 'list-group-item') do
             link_to(brand_connection.brand.name, admin_brand_path(brand_connection.brand))
          end
        end
    end
    BrandConnection.column_names.each do |c|
          column c.to_sym
    end
  end

  controller do
     def scoped_collection
          super.includes :brand # prevents N+1 queries to your database
     end
  end

end
