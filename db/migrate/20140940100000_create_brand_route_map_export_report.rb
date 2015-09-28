class CreateBrandRouteMapExportReport < ActiveRecord::Migration
  def change
    create_table :brand_route_map_export_reports do |t|
      t.references :brand
      t.string :workflow_state
      t.string :location
      t.json :details, default: {}
      t.json :schedule_report_keys, default: {}
      t.json :expected_schedule_report_keys, default: []

      t.timestamps
    end
  end
end
