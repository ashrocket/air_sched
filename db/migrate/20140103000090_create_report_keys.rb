class CreateReportKeys < ActiveRecord::Migration
  def change
    create_table :report_keys do |t|
      t.string :report_key
      t.string :name
      t.string :city
      t.boolean :active
      t.string :slug


      t.timestamps
    end
    add_index :report_keys, :report_key, unique: true
    add_index :report_keys, :slug, unique: true

  end
end
