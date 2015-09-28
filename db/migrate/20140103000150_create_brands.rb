class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :brand_key,  default: 'NULLBRAND'
      t.string :name, default: 'NULLBRAND' 
      t.string :description
      t.boolean :active
      t.string :slug


      t.timestamps
    end
    add_index :brands, :brand_key, unique: true
    add_index :brands, :slug, unique: true

  end
end
