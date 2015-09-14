class CreatePotentialBrandedJourneys < ActiveRecord::Migration
  def change
    create_table :potential_branded_journeys do |t|
      t.string :journey
      t.integer :segments
      t.references :potential_branded_market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
