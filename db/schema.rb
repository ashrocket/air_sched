# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140602031136) do

  create_table "airlines", force: true do |t|
    t.string "code"
    t.string "name"
    t.string "country"
    t.string "slug"
  end

  add_index "airlines", ["code"], name: "index_airlines_on_code", unique: true, using: :btree
  add_index "airlines", ["slug"], name: "index_airlines_on_slug", unique: true, using: :btree

  create_table "airports", force: true do |t|
    t.string "code"
    t.string "name"
    t.string "city"
    t.string "slug"
  end

  add_index "airports", ["code"], name: "index_airports_on_code", unique: true, using: :btree
  add_index "airports", ["slug"], name: "index_airports_on_slug", unique: true, using: :btree

  create_table "carriers", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "country"
    t.boolean  "active"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carriers", ["code"], name: "index_carriers_on_code", unique: true, using: :btree
  add_index "carriers", ["slug"], name: "index_carriers_on_slug", unique: true, using: :btree

  create_table "cnx_pairs", force: true do |t|
    t.string "cxr"
    t.string "hub"
    t.string "origin"
    t.string "origin_name"
    t.string "dest"
    t.string "dest_name"
  end

  add_index "cnx_pairs", ["origin", "dest", "origin_name", "dest_name"], name: "cnx_pairs_o_and_d", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "destinations", force: true do |t|
    t.string "hub"
    t.string "cxx"
    t.string "origin"
    t.string "origin_code"
    t.string "cxrs1"
    t.string "hub_name"
    t.string "hub_code"
    t.string "cxrs2"
    t.string "dest"
    t.string "dest_code"
  end

  create_table "direct_flights", force: true do |t|
    t.string "cxx"
    t.string "hub"
    t.string "origin"
    t.string "dest"
    t.string "carriers"
  end

  add_index "direct_flights", ["origin", "dest"], name: "direct_flights_o_and_d", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "hubs", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "city"
    t.boolean  "active"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hubs", ["code"], name: "index_hubs_on_code", unique: true, using: :btree
  add_index "hubs", ["slug"], name: "index_hubs_on_slug", unique: true, using: :btree

  create_table "oag_reports", force: true do |t|
    t.string   "msg_id"
    t.text     "load_status"
    t.datetime "received"
    t.string   "attachment_path"
    t.integer  "attachment_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oag_schedules", force: true do |t|
    t.string   "cxr"
    t.string   "hub"
    t.string   "key"
    t.datetime "eff_date"
    t.datetime "disc_date"
    t.string   "airline_code"
    t.string   "airline_name"
    t.string   "flight_num"
    t.boolean  "op",                  default: false
    t.string   "op_cxr_code"
    t.string   "op_cxr_name"
    t.string   "op_flight_num"
    t.string   "shared_airline_code"
    t.string   "shared_airline_name"
    t.string   "mkt_cxrs"
    t.string   "origin_apt"
    t.string   "origin_apt_name"
    t.string   "origin_apt_city"
    t.string   "dest_apt"
    t.string   "dest_apt_name"
    t.string   "dest_apt_city"
    t.string   "dep_op_days"
    t.string   "arr_op_days"
    t.string   "dep_time_local"
    t.string   "arr_time_local"
    t.string   "next_day_arrival"
    t.string   "duration"
    t.integer  "stops"
    t.string   "restrictions"
    t.string   "via_apts"
    t.string   "mkt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oag_schedules", ["airline_code", "flight_num"], name: "oag_flight_id", using: :btree
  add_index "oag_schedules", ["cxr", "disc_date"], name: "oag_cxr_disc_date", using: :btree
  add_index "oag_schedules", ["cxr", "eff_date", "disc_date", "origin_apt", "dep_time_local"], name: "oag_cxr_origins", using: :btree
  add_index "oag_schedules", ["cxr", "eff_date", "disc_date"], name: "oag_cxr_eff_disc_dates", using: :btree
  add_index "oag_schedules", ["cxr", "eff_date"], name: "oag_cxr_eff_date", using: :btree
  add_index "oag_schedules", ["dep_time_local", "flight_num"], name: "oag_flight_id_time", using: :btree
  add_index "oag_schedules", ["dest_apt"], name: "index_oag_schedules_on_dest_apt", using: :btree
  add_index "oag_schedules", ["hub", "disc_date"], name: "oag_disc_date", using: :btree
  add_index "oag_schedules", ["hub", "eff_date", "disc_date", "origin_apt", "dep_time_local"], name: "oag_origins", using: :btree
  add_index "oag_schedules", ["hub", "eff_date", "disc_date"], name: "oag_eff_disc_dates", using: :btree
  add_index "oag_schedules", ["hub", "eff_date"], name: "oag_eff_date", using: :btree
  add_index "oag_schedules", ["mkt"], name: "index_oag_schedules_on_mkt", using: :btree
  add_index "oag_schedules", ["origin_apt", "dest_apt"], name: "oag_comp_mkt", using: :btree
  add_index "oag_schedules", ["origin_apt"], name: "index_oag_schedules_on_origin_apt", using: :btree

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.text     "tip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

end
