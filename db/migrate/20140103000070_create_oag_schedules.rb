class CreateOagSchedules < ActiveRecord::Migration

  def change
     create_table :oag_schedules do |t|
       t.references :report_key
       t.references :schedule_set
       t.datetime :eff_date
       t.datetime :disc_date

       t.string :airline_code
       t.string :airline_name
       t.string :flight_num
       t.boolean :op, default: false
       t.string :op_cxr_code
       t.string :op_cxr_name
       t.string :op_flight_num
       t.string :shared_airline_code
       t.string :shared_airline_name
       t.string :mkt_cxrs
       t.string :origin_apt
       t.string :origin_apt_name
       t.string :origin_apt_city
       t.string :dest_apt
       t.string :dest_apt_name
       t.string :dest_apt_city
       t.integer :dep_op_days, array: true, default: []
       t.integer :arr_op_days, array: true, default: []
       t.string :dep_time_local
       t.string :arr_time_local
       t.boolean :next_day_arrival, default: false
       t.string :duration
       t.integer :stops
       t.string :restrictions

       t.string :via_apts
       t.string :mkt


       t.timestamps
     end
     add_index :oag_schedules, [:report_key_id], :name => 'oag_sched_rk_cs'
     add_index :oag_schedules, [:report_key_id, :origin_apt], :name => 'oag_keyed_origins'
     add_index :oag_schedules, [:report_key_id, :dest_apt], :name => 'oag_keyed_dests'
     add_index :oag_schedules, [:report_key_id, :origin_apt, :dest_apt], :name => 'oag_keyed_airports'
     add_index :oag_schedules, [:report_key_id, :mkt], :name => 'oag_keyed_mkts'



     add_index :oag_schedules, [:report_key_id, :eff_date], :name => 'oag_eff_date'
     add_index :oag_schedules, [:report_key_id, :disc_date], :name => 'oag_disc_date'
     add_index :oag_schedules, [:report_key_id, :eff_date, :disc_date], :name => 'oag_eff_disc_dates'
     add_index :oag_schedules, [:report_key_id, :eff_date, :disc_date, :origin_apt, :dep_time_local], :name => 'oag_departures'


     add_index :oag_schedules, [:report_key_id,:airline_code, :flight_num], :name => 'oag_flight_id'
     add_index :oag_schedules, [:report_key_id,:dep_time_local, :flight_num], :name => 'oag_flight_id_time'


    add_index :oag_schedules, :schedule_set_id, :name => 'oag_sset'
    add_index :oag_schedules, [:schedule_set_id, :origin_apt], :name => 'oag_sset_origins'
    add_index :oag_schedules, [:schedule_set_id, :dest_apt], :name => 'oag_sset_dests'
    add_index :oag_schedules, [:schedule_set_id, :origin_apt, :dest_apt], :name => 'oag_sset_airports'
    add_index :oag_schedules, [:schedule_set_id, :mkt], :name => 'oag_sset_mkts'



    add_index :oag_schedules, [:schedule_set_id, :eff_date], :name => 'oag_sset_eff_date'
    add_index :oag_schedules, [:schedule_set_id, :disc_date], :name => 'oag_sset_disc_date'
    add_index :oag_schedules, [:schedule_set_id, :eff_date, :disc_date], :name => 'oag_sset_eff_disc_dates'
    add_index :oag_schedules, [:schedule_set_id, :eff_date, :disc_date, :origin_apt, :dep_time_local], :name => 'oag_sset_departures'


    add_index :oag_schedules, [:schedule_set_id,:airline_code, :flight_num], :name => 'oag_sset_flight_id'
    add_index :oag_schedules, [:schedule_set_id,:dep_time_local, :flight_num], :name => 'oag_sset_flight_id_time'

   end

end
