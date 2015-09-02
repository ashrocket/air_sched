class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :brand_key,  default: 'NULLBRAND'
      t.string :name, default: 'NULLBRAND' 
      t.string :description
      t.string :default_currency
      t.json   :data_states, default: {}
      t.integer :max_segments, default: 3
      t.boolean :active
      t.string :slug


      t.timestamps
    end
    add_index :brands, :brand_key, unique: true
    add_index :brands, :slug, unique: true

  end
end
