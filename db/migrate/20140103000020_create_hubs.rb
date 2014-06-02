class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.string :code
      t.string :name
      t.string :city
      t.boolean :active
      t.string :slug


      t.timestamps
    end
    add_index :hubs, :code, unique: true
    add_index :hubs, :slug, unique: true

  end
end
