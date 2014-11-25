class AddLatLongToAirports < ActiveRecord::Migration
  def change
  	add_column :airports, :lat, :decimal, {:precision=>10, :scale=>6}
	add_column :airports, :long, :decimal, {:precision=>10, :scale=>6}
  end
end
