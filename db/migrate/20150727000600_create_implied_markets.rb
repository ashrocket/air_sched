class CreateImpliedMarkets < ActiveRecord::Migration
  def change
    create_table :implied_markets do |t|
      t.string :origin
      t.string :dest
      t.references :brand

    end
    add_index :implied_markets, [:brand_id, :origin, :dest], :name => 'imp_mkt__o_and_d'

  end
end
