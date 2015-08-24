class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.references :brand
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
