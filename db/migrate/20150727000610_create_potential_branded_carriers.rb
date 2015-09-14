class CreatePotentialBrandedCarriers < ActiveRecord::Migration
  def change
    create_table :potential_branded_carriers do |t|
      t.string :cxr
      t.string :carrier_name
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
