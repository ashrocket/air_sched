class CreateCnxPairs < ActiveRecord::Migration
  def change
    create_table :cnx_pairs do |t|
      t.string :cxr
      t.string :hub
      t.string :origin
      t.string :origin_name
      t.string :dest
      t.string :dest_name
    end

    add_index :cnx_pairs, [:origin,:dest, :origin_name, :dest_name], :name => 'cnx_pairs_o_and_d'

  end
end
