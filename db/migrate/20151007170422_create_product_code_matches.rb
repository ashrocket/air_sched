class CreateProductCodeMatches < ActiveRecord::Migration
  def change
    create_table :product_code_matches do |t|
      t.string :fare_field_match
      t.string :match_expr
      t.references :product_code, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
