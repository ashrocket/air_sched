class CreateBrandedMarketRouteMaps < ActiveRecord::Migration
  def change
    create_table :branded_market_route_maps do |t|
      t.references :brand
      t.string :origin
      t.string :dest
      t.json :route_map, default: {}

    end


  end
end
