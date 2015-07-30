class CreateBrandedMarketRequests < ActiveRecord::Migration
  def change
    create_table :branded_market_requests do |t|
      t.references :brand
      t.string :brand_key,  null: false
      t.string :origin
      t.string :dest

    end


  end
end
