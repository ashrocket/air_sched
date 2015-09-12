class CreateBrandedRouteMaps < ActiveRecord::Migration
  def change
    create_table :branded_route_maps do |t|
      t.references :brand
      t.json :route_map, default: {}

    end


  end
end
