ActiveAdmin.register OagReport  do
  menu priority: 0, label: 'Oag Imports', :parent => 'Reports'
  actions :all, :except => [:new, :edit]

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
       @oag_report = OagReport.find(params[:id])
        render :show,  layout: 'active_admin'
     end
   end


  index do

      selectable_column
      column 'Mail Id' do |report|
        report.msg_id
      end
      column 'Report Key', :sortable => :report_key do |report|
        if report.report_key
          link_to report.report_key.report_key, admin_report_key_path(report.report_key)
        else
          'No Report Key Matched'
        end
      end
      column 'Finished', :sortable => :complete  do |report|
        pretty_boolean(report.complete)
      end
      column 'Status', :sortable => :report_status do |report|
        report.current_state.name
      end
      column 'Modified', :sortable => :updated_at do |report|
        report.updated_at
      end
      # column 'Message Date', :sortable => :received do |report|
      #   report.received
      # end
      column  'Detail Status', class: 'load_status_col', :sortable => :load_status do |report|
        report.load_status
      end

    actions
  end


end
