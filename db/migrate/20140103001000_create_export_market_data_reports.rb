class CreateExportMarketDataReports < ActiveRecord::Migration
  def change
    create_table :export_market_data_reports do |t|
      t.string :status
      t.string :location
      t.string :workflow_state

      t.timestamps
    end
  end
end
