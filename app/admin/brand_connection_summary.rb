ActiveAdmin.register BrandConnection, :as => "Connections Summary"  do
  menu priority: 1, label: 'Connections', :parent => 'Data'


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
         column :brand
         column :origin
         column :via
         column :dest
         column :sched1_cxr
         column :sched2_cxr
         column :eff
         column :disc
         column :operating_window

         actions
   end
  controller do
      def scoped_collection
           super.includes :brand # prevents N+1 queries to your database
      end
   end
end
