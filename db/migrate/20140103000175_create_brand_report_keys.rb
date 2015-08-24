class CreateBrandReportKeys < ActiveRecord::Migration
  def change
    create_table :brand_report_keys do |t|
      t.references :brand, index: true, foreign_key: true
      t.references :report_key, index: true, foreign_key: true
    end
  end
end
