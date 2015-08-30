class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :report_key
      t.string :origin
      t.string :origin_code
      t.string :cxrs1, array: true, default: []
      t.string :hub_name
      t.string :hub_code
      t.string :cxrs2, array: true, default: []
      t.string :dest
      t.string :dest_code
      t.json :eff_days, default: []

      t.timestamps

    end
  end
end
