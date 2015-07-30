class CreateBrandedMarketRouteRequests < ActiveRecord::Migration
  def change
    create_table :branded_market_route_requests do |t|
      t.integer :order
      t.references :branded_route_request
      t.references :branded_market_request


    end


  end
end
