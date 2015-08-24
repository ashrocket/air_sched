class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :brand_key,  null: false
      t.string :name,  null: false
      t.string :description
      t.string :default_currency
      t.json :host_map

      t.boolean :active
      t.string :slug


      t.timestamps
    end
    add_index :brands, :brand_key, unique: true
    add_index :brands, :slug, unique: true

  end
end
