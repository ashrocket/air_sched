class CreateDirectFlights < ActiveRecord::Migration
  def change
    create_table :direct_flights do |t|
      t.references :report_key
      t.string :origin
      t.string :dest
      t.string :carriers, array: true, default: []
    end
    add_index :direct_flights, :origin, :name => 'direct_flights_o'
    add_index :direct_flights, :dest, :name => 'direct_flights_d'
    add_index :direct_flights, [:origin,:dest], :name => 'direct_flights_o_and_d'

  end
end
