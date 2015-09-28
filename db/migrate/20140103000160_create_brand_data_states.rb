class CreateBrandDataStates < ActiveRecord::Migration
  def change
    create_table :brand_data_states do |t|
      t.string :workflow_state
      t.json :stats, default: {}
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
