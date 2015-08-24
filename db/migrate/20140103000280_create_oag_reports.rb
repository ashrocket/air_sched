class CreateOagReports < ActiveRecord::Migration
  def change
    create_table :oag_reports do |t|
      t.string   :msg_id
      t.string   :report_key
      t.json     :load_status
      t.string   :report_status, default: 'uninitialized'
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
