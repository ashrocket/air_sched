class CreateBrandedRouteMapValidatorReports < ActiveRecord::Migration
  def change
    create_table :branded_route_map_validator_reports do |t|
      t.references :brand
      t.string :workflow_state
      t.string :location
      t.json :details, default: {}

      t.timestamps
    end
  end
end
