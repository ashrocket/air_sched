class CreateExportSmartRouteReports < ActiveRecord::Migration
  def change
    create_table :export_smart_route_reports do |t|
      t.string :brand_key
      t.string :status
      t.string :origin
      t.string :dest
      t.string :number_of_segments
      t.text   :brand_routes

      t.string :location

      t.timestamps
    end
  end
end
