class CreateAirlineHosts < ActiveRecord::Migration
  def change
    create_table :airline_hosts do |t|
      t.string :host_key,  null: false
      t.string :name,  null: false
      t.string :description
      t.boolean :active
      t.string :slug


      t.timestamps
    end
    add_index :airline_hosts, :host_key, unique: true
    add_index :airline_hosts, :slug, unique: true

  end
end
