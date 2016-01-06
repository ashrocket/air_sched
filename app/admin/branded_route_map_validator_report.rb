ActiveAdmin.register BrandedRouteMapValidatorReport  do
  menu priority: 3, label: 'Validation Reports', parent: 'Reports'
  actions :all, :except => [:new,:edit]


  controller do
      def scoped_collection
                super.includes :brand # prevents N+1 queries to your database
      end
      def show
        @brand_route_map_export_report = BrandedRouteMapValidatorReport.find(params[:id])
         render :show,  layout: 'active_admin'
      end
    end

  index do
    selectable_column

      column 'Report Id' do |validator_report|
        validator_report.id
      end
      column :brand
      column :state do |validator_report|
        validator_report.current_state.name
      end
      column :location do |validator_report|
        unless validator_report.location.blank?
           link_to validator_report.location, validator_report.location
        end
      end
      column :details
      column 'Modified', :sortable => :updated_at do |validator_report|
        validator_report.updated_at
      end
      column 'Created', :sortable => :created_at do |validator_report|
        validator_report.created_at
      end
      actions

  end





end
