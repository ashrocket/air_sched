class CreateBrandedRouteMaps < ActiveRecord::Migration
  def change
    create_table :branded_route_maps do |t|
      t.references :brand
      t.string :brand_key,  null: false
      t.json :route_map

    end


  end
end
