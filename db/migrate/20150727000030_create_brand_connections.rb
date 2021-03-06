class CreateBrandConnections < ActiveRecord::Migration
  def change
    create_table :brand_connections do |t|
      t.references :brand,  null: false
      t.string :origin
      t.string :via
      t.string :dest
      t.references :sched1
      t.references :sched2
      t.string :sched1_cxr
      t.string :sched2_cxr
      t.json :sched1_eff_dates, default: {}
      t.json :sched1_operating, default: []
      t.json :sched2_eff_dates, default: {}
      t.json :sched2_operating, default: []
      t.json :ct_minutes, default: []
      t.date :eff
      t.date :disc
      t.integer :operating_window, array:true , default: []



      t.timestamps
    end

  end
end
