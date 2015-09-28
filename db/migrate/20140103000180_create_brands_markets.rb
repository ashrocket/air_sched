class CreateBrandsMarkets < ActiveRecord::Migration
  def change
    create_table :brands_markets do |t|
      t.references :brand, index: true, foreign_key: true
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
