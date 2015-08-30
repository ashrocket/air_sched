class CreateAirportCurrencies < ActiveRecord::Migration
  def change
    create_table :airport_currencies do |t|

     t.string :name
     t.string :city
     t.string :iata
     t.string :icao
     t.string :country
     t.string :country_code
     t.decimal :latitude, precision:64, scale:12
     t.decimal :longitude, precision:64, scale:12
     t.string :currency_code

    end


  end
end
