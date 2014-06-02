class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :code
      t.string :name
      t.string :country
      t.string :slug


    end
    add_index :airlines, :code, unique: true
    add_index :airlines, :slug, unique: true

  end
end
