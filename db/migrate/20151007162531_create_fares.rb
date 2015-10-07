class CreateFares < ActiveRecord::Migration
  def change
    create_table :fares do |t|
      t.string :fbc
      t.string :source
      t.float :base_amount
      t.string :origin
      t.string :dest

      t.timestamps null: false
    end
  end
end
