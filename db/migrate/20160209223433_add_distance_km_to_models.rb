class AddDistanceKmToModels < ActiveRecord::Migration
  def change
      add_column :oag_schedules, :distance_km,  :int, default: 0
      add_column :brand_connections, :distance_km,  :int, default: 0
      add_column :brand_connections, :s1_distance_km,  :int, default: 0
      add_column :brand_connections, :s2_distance_km,  :int, default: 0
      add_column :direct_flights, :distance_km,  :int, default: 0
      add_column :branded_route_requests, :distance_km,  :int, default: 0
      add_column :branded_market_requests, :distance_km,  :int, default: 0
      add_column :branded_market_segments_requests, :distance_km,  :int, default: 0
  end
end
