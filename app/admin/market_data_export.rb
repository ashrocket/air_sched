ActiveAdmin.register ExportMarketDataReport, :as => "Market Exports" do
  menu priority: 4, :parent => "Reports"
  actions :all, :except => [:new]

  index do
          selectable_column
          column 'Report Id' do |report|
            report.id
          end
          column :status
          column :location
          column 'Modified', :sortable => :updated_at do |report|
            report.updated_at
          end
          column 'Created', :sortable => :created_at do |report|
            report.created_at
          end
          actions

  end

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


end
