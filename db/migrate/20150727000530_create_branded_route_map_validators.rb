class CreateBrandedRouteMapValidators < ActiveRecord::Migration
  def change
    create_table :branded_route_map_validators do |t|
      t.references :brand
      t.string :possible_route_map_rows, array: true, default: []

    end


  end
end
