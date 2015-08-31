class CreateAppControls < ActiveRecord::Migration
  def change
    create_table :app_controls do |t|
      t.references :report_key, index: true
      t.references :brand, index: true

    end
  end
end
