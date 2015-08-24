class CreateAirlinesHosts < ActiveRecord::Migration
  def change
    create_table :airlines_hosts do |t|
      t.references :airline, index: true, foreign_key: true
      t.references :host, index: true, foreign_key: true
    end
  end
end
