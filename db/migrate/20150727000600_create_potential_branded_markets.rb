class CreatePotentialBrandedMarkets < ActiveRecord::Migration
  def change
    create_table :potential_branded_markets do |t|
      t.string :origin
      t.string :dest
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
