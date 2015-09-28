class CreateBrandExportStates < ActiveRecord::Migration
  def change
    create_table :brand_export_states do |t|
      t.string :workflow_state
      t.json :details
      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
