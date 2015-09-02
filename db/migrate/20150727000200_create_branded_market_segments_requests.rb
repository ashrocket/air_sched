class CreateBrandedMarketSegmentsRequests < ActiveRecord::Migration
  def change
    create_table :branded_market_segments_requests do |t|
      t.references :brand
      t.string :origin
      t.string :dest
      t.integer :segment_count
      t.integer :branded_market_request_ids, array: true, default: []
    end

  end
end
