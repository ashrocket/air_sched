class CreateAppSwitches < ActiveRecord::Migration
  def change
    create_table :app_switches do |t|
      t.string :name
      t.boolean :enabled

      t.timestamps
    end
  end
end
