class CreateCityPairs < ActiveRecord::Migration
  def change
    create_table :city_pairs do |t|
    	t.string :hub
    	t.string :orig
    	t.string :dest
    	t.text :outbound
    	t.text :inbound
    end
    add_index :city_pairs, [:hub, :orig, :dest]
  end
end

