class CreateReportKeys < ActiveRecord::Migration
  def change
    create_table :report_keys do |t|
      t.string :code,  null: false
      t.string :name,  null: false
      t.string :workflow_state, default: 'idle'
      t.string :file_pattern,  null: false, default: '(?!)'
      t.string  :comment
      t.boolean :active
      t.string  :slug
      t.integer :current_schedule_set_id

      t.timestamps
    end
    add_index :report_keys, :code, unique: true
    add_index :report_keys, :slug, unique: true

  end
end
