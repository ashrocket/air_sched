class CreateExportSmartRouteReports < ActiveRecord::Migration
  def change
    create_table :export_smart_route_reports do |t|
      t.references :brand
      t.string :status
      t.string :workflow_state
      # t.string :origin
      # t.string :dest
      # t.string :number_of_segments
      # t.text   :brand_routes

      t.string :location
      t.json :details, default: {}

      t.timestamps
    end
  end
end
