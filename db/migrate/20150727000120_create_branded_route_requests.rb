class CreateBrandedRouteRequests < ActiveRecord::Migration
  def change
    create_table :branded_route_requests do |t|
      t.references :brand
      t.string :brand_key,  null: false
      t.string :key
      t.string :origin
      t.string :dest
      t.string :cxrs, array: true, default: []
      t.string :host

    end

   add_index :branded_route_requests, :key, unique: true

  end
end
