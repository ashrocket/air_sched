ActiveAdmin.register OagSchedule  do
  menu priority: 2, label: 'Schedules - Full', :parent => 'Data'
  actions :all, :except => [:new, :edit]


  filter :report_key, filters: [:cont, :eq, :start, :end]
  filter :origin_apt, filters: [:cont, :eq, :start, :end]
  filter :dest_apt, filters: [:cont, :eq, :start, :end]
  filter :dep_time_local
  filter :arr_time_local

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
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


end
