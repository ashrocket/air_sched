class CreateBrandConnectionTemplates < ActiveRecord::Migration
  def change
    create_table :brand_connection_templates do |t|
      t.string :brand_key,  null: false
      t.string :origin
      t.string :via
      t.string :dest
      t.string :sched1_cxr
      t.string :sched2_cxr
      t.date :eff
      t.date :disc
      t.integer  :operating_window, array: true, defalt: []



      t.timestamps
    end

  end
end
