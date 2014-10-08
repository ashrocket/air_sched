class CreateMarketDataExports < ActiveRecord::Migration
  def change
    create_table :market_data_exports do |t|
      t.string :status
      t.string :location

      t.timestamps
    end
  end
end
