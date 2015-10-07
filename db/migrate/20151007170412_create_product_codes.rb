class CreateProductCodes < ActiveRecord::Migration
  def change
    create_table :product_codes do |t|
      t.string :desc
      t.string :code
      t.string :name

      t.timestamps null: false
    end
  end
end
