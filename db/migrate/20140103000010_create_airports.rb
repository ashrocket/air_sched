class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code
      t.string :name
      t.string :city
      t.decimal :lat, {:precision=>10, :scale=>6}
    	t.decimal :long, {:precision=>10, :scale=>6}
      t.string :slug


    end
    add_index :airports, :code, unique: true
    add_index :airports, :slug, unique: true

  end
end
