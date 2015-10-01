ActiveAdmin.register ScheduleSet  do
  menu priority: 0, label: 'Schedule Imports', :parent => 'Reports'
  actions :all, :except => [:new, :edit]

  filter :report_key, filters: [:cont, :eq, :start, :end]
  filter :workflow_state, filters: [:cont, :eq, :start, :end]
  filter :complete
  filter :created_at


  batch_action :destroy, confirm: "Active Schedule sets will not be deleted, continue?" do |ids|
    ids.each do |id|
      sched_set = ScheduleSet.find(id)
      unless sched_set.active?
        sched_set.destroy
      end
    end
    redirect_to admin_schedule_sets_path
  end
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
  controller do
     def show
       @schedule_set = ScheduleSet.find(params[:id])
        render :show,  layout: 'active_admin'
     end
   end


  index do

      selectable_column
      column :id
      column 'Mail Id' do |report|
        report.msg_id
      end
      column 'Report Key', :sortable => :report_key do |report|
        if report.report_key
          link_to report.report_key.code, admin_report_key_path(report.report_key)
        else
          'No Report Key Matched'
        end
      end
      column 'Finished', sortable: :complete  do |schedule_set|
        pretty_boolean(schedule_set.complete)
      end
      column 'Active' do |schedule_set|
        pretty_boolean(schedule_set.active?)
      end
      column 'Status', :sortable => :report_status do |schedule_set|
        schedule_set.current_state.name
      end
      column 'Modified', :sortable => :updated_at do |schedule_set|
        schedule_set.updated_at
      end
      # column 'Message Date', :sortable => :received do |schedule_set|
      #   schedule_set.received
      # end
      column  'Detail Status', class: 'load_status_col', :sortable => :load_status do |schedule_set|
        schedule_set.load_status
      end
      actions  defaults: false do |schedule_set|
        if schedule_set.active?
          link_to("View", admin_schedule_set_path(schedule_set), class: "member_link")
        else
          link_to("View", admin_schedule_set_path(schedule_set), class: "member_link") +
          link_to("Remove", admin_schedule_set_path(schedule_set), :method => :delete, class: "member_link")
        end
      end
  end


end
