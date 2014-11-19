class CreatePossibleFlights < ActiveRecord::Migration
  def change
    create_table :possible_flights do |t|
    	t.string :hub
    	t.string :orig
    	t.string :dest
    	t.text :outbound
    	t.text :inbound
    end
    add_index :possible_flights, [:hub, :orig, :dest]
  end
end
