class CreateBrandedPriceRequests < ActiveRecord::Migration
  def change
    create_table :branded_price_requests do |t|
      t.references :route_request
      t.string  :pricing_key
      t.string  :eff
      t.string  :disc
      t.integer :operating_window, array: true, defalt: []

    end
    add_index :branded_price_requests, :pricing_key, unique: true

  end
end
