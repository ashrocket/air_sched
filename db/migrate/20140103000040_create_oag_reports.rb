class CreateOagReports < ActiveRecord::Migration
  def change
    create_table :oag_reports do |t|
      t.string :url
      t.string :filename
      t.string :report_type
      t.datetime :report_date
      t.string :datecode
      t.timestamps
    end
  end
end
