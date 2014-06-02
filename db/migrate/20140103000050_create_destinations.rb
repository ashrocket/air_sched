class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :hub
      t.string :cxx
      t.string :origin
      t.string :origin_code
      t.string :cxrs1
      t.string :hub_name
      t.string :hub_code
      t.string :cxrs2
      t.string :dest
      t.string :dest_code
    end
  end
end
