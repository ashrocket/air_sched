ActiveAdmin.register OagReport, :as => 'OAG Imports' do
  menu :parent => 'Reports'
  actions :all, :except => [:new]

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
          column 'Mail Id' do |report|
            report.msg_id
          end
          column 'Report Key', :sortable => :report_key do |report|
            report.report_key
          end
          column 'Finished', :sortable => :complete  do |report|
            report.complete
          end
          column 'Status', :sortable => :report_status do |report|
            report.report_status
          end
          column 'Modified', :sortable => :updated_at do |report|
            report.updated_at
          end
          column 'Message Date', :sortable => :received do |report|
            report.received
          end
          column 'Detail Status', :sortable => :load_status do |report|
            report.load_status
          end

     end

end
