class CreateBrandConnections < ActiveRecord::Migration
  def change
    create_table :brand_connections do |t|
      t.references :brand,  null: false
      t.string :brand_key,  null: false
      t.string :origin
      t.string :via
      t.string :dest
      t.references :sched1
      t.references :sched2
      t.string :sched1_cxr
      t.string :sched2_cxr
      t.json :sched1_eff_dates
      t.json :sched1_operating
      t.json :sched2_eff_dates
      t.json :sched2_operating
      t.json :ct_minutes
      t.date :eff
      t.date :disc
      t.integer :operating_window, array:true , default: []



      t.timestamps
    end

  end
end
