class CreateBrandedMarketRouteRequests < ActiveRecord::Migration
  def change
    create_table :branded_market_route_requests  do |t|
      t.integer :position
      t.integer :branded_route_request_id
      t.integer :branded_market_request_id

    end

  end
end
