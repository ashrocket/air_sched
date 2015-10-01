class CreateImpliedDirectFlights < ActiveRecord::Migration
  def change
    create_table :implied_direct_flights do |t|
      t.references :brand
      t.references :implied_market

    end

  end
end
