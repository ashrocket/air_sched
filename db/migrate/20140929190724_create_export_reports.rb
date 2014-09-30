class CreateExportReports < ActiveRecord::Migration
  def change
    create_table :export_reports do |t|
      t.string :status
      t.string :location

      t.timestamps
    end
  end
end
