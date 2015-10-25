class CreateBrandedRouteMapValidators < ActiveRecord::Migration
  def change
    create_table :branded_route_map_validators do |t|
      t.references :implied_market
      t.json :route_map_counts, default: {}
      t.json :route_map_structures, default: {}

    end


  end
end
