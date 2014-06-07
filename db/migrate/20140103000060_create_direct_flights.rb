class CreateDirectFlights < ActiveRecord::Migration
  def change
    create_table :direct_flights do |t|
      t.string :report_key
      t.string :origin
      t.string :dest
      t.string :carriers
    end
    add_index :direct_flights, [:origin,:dest], :name => 'direct_flights_o_and_d'

  end
end
