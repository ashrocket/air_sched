class CreateScheduleSets < ActiveRecord::Migration
  def change
    create_table :schedule_sets do |t|
      t.references :report_key
      t.string   :msg_id
      t.string   :workflow_state, default: 'uninitialized'
      t.json     :load_status, default: {}
      t.json     :log_data, default: []
      t.string   :attachment_status, default: 'unstored'
      t.datetime :received
      t.integer  :attachment_lines, default: 0
      t.string   :attachment_path
      t.integer  :attachment_size
      t.string :carriers, array: true, default: []

      t.boolean  :complete, :default => false

      t.timestamps
    end
  end
end
