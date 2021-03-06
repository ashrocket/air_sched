ActiveAdmin.register OagSchedule, :as => "Schedule Summaries" do
  menu priority: 3,  :parent => "Data"
  actions :all, :except => [:new]

  filter :report_key, filters: [:cont, :eq, :start, :end]
  filter :airline_code, filters: [:cont, :eq, :start, :end]
  filter :origin_apt, filters: [:cont, :eq, :start, :end]
  filter :dest_apt, filters: [:cont, :eq, :start, :end]
  filter :dep_time_local
  filter :arr_time_local

  # filter :op, :as => :select
  # filter :next_day_arrival, :as => :select

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
    index do
         column 'Key', :sortable => :report_key_string do |sched|
           link_to sched.report_key.code, admin_report_key_path(sched.report_key)
         end
         column :airline_code
         column 'Origin Apt Code' do |sched|
           sched.origin_apt
         end
         column 'Dest Apt Code' do |sched|
           sched.dest_apt
         end

         column 'EffectiveDT' do |sched|
           sched.eff_date.strftime('%Y-%m-%d')
         end
         column 'Discontinue'  do |sched|
           sched.disc_date.strftime('%Y-%m-%d')
         end
         column :op
         column 'flt num', :sortable => :flight_num do |sched|
           sched.plated_flt_number
         end
         column 'Dep Time' do |sched|
           sched.dep_time_local
         end
         column 'Arr Time' do |sched|
           sched.arr_time_local
         end
         column :dep_op_days
         column :stops
         column 'Overnight' do |sched|
           sched.next_day_arrival ? 'Yes' : 'No'
         end
         column :airline_name

         column 'Origin Apt', :sortable => :origin_apt_name do |sched|
           "#{sched.origin_apt_name}, #{sched.origin_apt_city}"
         end
         column 'Dest Apt' do |sched|
           "#{sched.dest_apt_name}, #{sched.dest_apt_city}"
         end
         column :arr_op_days
         column :mkt_cxrs
         column :duration
         column :restrictions
         column :via_apts
         column :mkt
    end
  controller do

      def scoped_collection
           super.includes :report_key # prevents N+1 queries to your database
      end
  end
end
