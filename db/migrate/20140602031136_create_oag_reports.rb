class CreateOagReports < ActiveRecord::Migration
  def change
    create_table :oag_reports do |t|
      t.string :msg_id
      t.string :msg_status
      t.datetime :received
      t.datetime :processed
      t.integer  :sched_count
      t.string   :filepath
      t.integer  :filesize
      t.integer  :uncompressed
      t.integer  :processing_duration
      t.string   :mail_type

      t.timestamps
    end
  end
end
