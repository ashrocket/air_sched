class AddBrandToBrandedMarketRouteRequest < ActiveRecord::Migration
  def change
    add_column :branded_market_route_requests, :brand_id, :int
    remove_column :branded_market_route_requests, :position, :int
    # rename_column :branded_market_route_requests, :position, :seg_count

  end
end
