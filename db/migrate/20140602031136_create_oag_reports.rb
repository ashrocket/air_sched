class CreateOagReports < ActiveRecord::Migration
  def change
    create_table :oag_reports do |t|
      t.string :msg_id
      t.text     :load_status
      t.datetime :received
      t.string   :attachment_path
      t.integer  :attachment_size

      t.timestamps
    end
  end
end
