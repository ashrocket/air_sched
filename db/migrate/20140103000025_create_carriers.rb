class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :code
      t.string :name
      t.string :country
      t.boolean :active
      t.string :slug


      t.timestamps
    end
    add_index :carriers, :code, unique: true
    add_index :carriers, :slug, unique: true

  end
end
