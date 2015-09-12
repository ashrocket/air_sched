class CreateBrandedMarketRequests < ActiveRecord::Migration
  def change
    create_table :branded_market_requests do |t|
      t.references :brand
      t.string :origin
      t.string :dest
      t.integer :seg_count, default: 0

    end


  end
end
