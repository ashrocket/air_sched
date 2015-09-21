class CreateCnxPairs < ActiveRecord::Migration
  def change
    create_table :cnx_pairs do |t|
      t.references :report_key
      t.string :origin, :limit =>(4)
      t.string :origin_name
      t.integer :origin_airport_id
      t.string :dest, :limit =>(4)
      t.string :dest_name
      t.integer :dest_airport_id

    end

    add_index :cnx_pairs, [:report_key_id, :origin, :dest, :origin_name, :dest_name], :name => 'cnx_pairs_o_and_d'

  end
end
