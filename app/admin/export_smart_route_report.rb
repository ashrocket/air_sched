ActiveAdmin.register ExportSmartRouteReport  do
  menu priority: 1, label: 'Route Map Reports', parent: 'Reports'
  actions :all, :except => [:new]

  index do
          column 'Report Id' do |report|
            report.id
          end
          column :brand

          column :status
          column :location
          column 'Modified', :sortable => :updated_at do |report|
            report.updated_at
          end
          column 'Created', :sortable => :created_at do |report|
            report.created_at
          end

  end




end
