class CreateExportSmartRouteReports < ActiveRecord::Migration
  def change
    create_table :export_smart_route_reports do |t|
      t.references :brand
      t.string :workflow_state
      t.string :location
      t.json :details, default: {}

      t.timestamps
    end
  end
end
