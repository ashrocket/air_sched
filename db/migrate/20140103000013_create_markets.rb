class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :code
      t.integer :origin_airport_id
      t.integer :dest_airport_id

      t.timestamps null: false
    end
  end
end
