class CreateBrandSettings < ActiveRecord::Migration
  def change
    create_table :brand_settings do |t|
      t.string :route_map_filename
      t.string :default_currency
      t.integer :max_segments, default: 3
      t.integer :schedule_load_timeout, default: 20

      t.references :brand, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
