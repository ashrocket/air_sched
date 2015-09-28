ActiveAdmin.register BrandRouteMapExportReport  do
  menu priority: 1, label: 'Route Map Reports', parent: 'Reports'
  actions :all, :except => [:new,:edit]


  controller do
      def show
        @brand_route_map_export_report = BrandRouteMapExportReport.find(params[:id])
         render :show,  layout: 'active_admin'
      end
    end

  index do
    selectable_column

      column 'Report Id' do |export_report|
        export_report.id
      end
      column :brand
      column :state do |report|
        report.current_state.name
      end
      column :location do |report|
        unless report.location.blank?
           link_to report.location, report.location
        end
      end
      column :details
      column 'Modified', :sortable => :updated_at do |report|
        report.updated_at
      end
      column 'Created', :sortable => :created_at do |report|
        report.created_at
      end
      actions

  end





end
