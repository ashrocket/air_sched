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

ActiveRecord::Schema.define(version: 20141003133309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.text     "namespace"
    t.text     "body"
    t.text     "resource_id",             null: false
    t.text     "resource_type",           null: false
    t.integer  "author_id",     limit: 8
    t.text     "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "idx_23396_index_active_admin_comments_on_author_type_and_author", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "idx_23396_index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "idx_23396_index_active_admin_comments_on_resource_type_and_reso", using: :btree

  create_table "activeadmin_settings_pictures", force: true do |t|
    t.text     "data"
    t.text     "data_file_size"
    t.text     "data_content_type"
    t.integer  "width",             limit: 8
    t.integer  "height",            limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
    t.text     "email",                            default: "", null: false
    t.text     "encrypted_password",               default: "", null: false
    t.text     "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 8, default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "idx_23405_index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "idx_23405_index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "airlines", force: true do |t|
    t.text "code"
    t.text "name"
    t.text "country"
    t.text "slug"
  end

  add_index "airlines", ["code"], name: "idx_23417_index_airlines_on_code", unique: true, using: :btree
  add_index "airlines", ["slug"], name: "idx_23417_index_airlines_on_slug", unique: true, using: :btree

  create_table "airports", force: true do |t|
    t.text "code"
    t.text "name"
    t.text "city"
    t.text "slug"
  end

  add_index "airports", ["code"], name: "idx_23426_index_airports_on_code", unique: true, using: :btree
  add_index "airports", ["slug"], name: "idx_23426_index_airports_on_slug", unique: true, using: :btree

  create_table "app_switches", force: true do |t|
    t.text     "name"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carriers", force: true do |t|
    t.text     "code"
    t.text     "name"
    t.text     "country"
    t.boolean  "active"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carriers", ["code"], name: "idx_23444_index_carriers_on_code", unique: true, using: :btree
  add_index "carriers", ["slug"], name: "idx_23444_index_carriers_on_slug", unique: true, using: :btree

  create_table "cnx_pairs", force: true do |t|
    t.text "report_key"
    t.text "origin"
    t.text "origin_name"
    t.text "dest"
    t.text "dest_name"
  end

  add_index "cnx_pairs", ["report_key", "origin", "dest", "origin_name", "dest_name"], name: "idx_23453_cnx_pairs_o_and_d", using: :btree

  create_table "destinations", force: true do |t|
    t.text "report_key"
    t.text "origin"
    t.text "origin_code"
    t.text "cxrs1"
    t.text "hub_name"
    t.text "hub_code"
    t.text "cxrs2"
    t.text "dest"
    t.text "dest_code"
  end

  create_table "direct_flights", force: true do |t|
    t.text "report_key"
    t.text "origin"
    t.text "dest"
    t.text "carriers"
  end

  add_index "direct_flights", ["origin", "dest"], name: "idx_23471_direct_flights_o_and_d", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.text     "slug",                     null: false
    t.integer  "sluggable_id",   limit: 8, null: false
    t.text     "sluggable_type"
    t.text     "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "idx_23489_index_friendly_id_slugs_on_slug_and_sluggable_type_an", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "idx_23489_index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "idx_23489_index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "idx_23489_index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "hubs", force: true do |t|
    t.text     "code"
    t.text     "name"
    t.text     "city"
    t.boolean  "active"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hubs", ["code"], name: "idx_23498_index_hubs_on_code", unique: true, using: :btree
  add_index "hubs", ["slug"], name: "idx_23498_index_hubs_on_slug", unique: true, using: :btree

  create_table "interline_cxr_rules", force: true do |t|
    t.integer  "report_key_id"
    t.text     "markets",       default: [],                   array: true
    t.text     "combinations",  default: [],                   array: true
    t.string   "rule_kind",     default: "allow", null: false
    t.boolean  "active",        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interline_cxr_rules", ["combinations"], name: "index_interline_cxr_rules_on_combinations", using: :gin
  add_index "interline_cxr_rules", ["markets"], name: "index_interline_cxr_rules_on_markets", using: :gin
  add_index "interline_cxr_rules", ["report_key_id"], name: "index_interline_cxr_rules_on_report_key_id", using: :btree

  create_table "market_data_exports", force: true do |t|
    t.text     "status"
    t.text     "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oag_reports", force: true do |t|
    t.text     "msg_id"
    t.text     "report_key"
    t.text     "load_status"
    t.text     "report_status",               default: "uninitialized"
    t.text     "attachment_status",           default: "unstored"
    t.datetime "received"
    t.text     "attachment_path"
    t.integer  "attachment_size",   limit: 8
    t.boolean  "complete",                    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oag_schedules", force: true do |t|
    t.text     "report_key"
    t.datetime "eff_date"
    t.datetime "disc_date"
    t.text     "airline_code"
    t.text     "airline_name"
    t.text     "flight_num"
    t.boolean  "op",                            default: false, null: false
    t.text     "op_cxr_code"
    t.text     "op_cxr_name"
    t.text     "op_flight_num"
    t.text     "shared_airline_code"
    t.text     "shared_airline_name"
    t.text     "mkt_cxrs"
    t.text     "origin_apt"
    t.text     "origin_apt_name"
    t.text     "origin_apt_city"
    t.text     "dest_apt"
    t.text     "dest_apt_name"
    t.text     "dest_apt_city"
    t.text     "dep_op_days"
    t.text     "arr_op_days"
    t.text     "dep_time_local"
    t.text     "arr_time_local"
    t.boolean  "next_day_arrival",              default: false, null: false
    t.text     "duration"
    t.integer  "stops",               limit: 8
    t.text     "restrictions"
    t.text     "via_apts"
    t.text     "mkt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oag_schedules", ["airline_code", "flight_num"], name: "idx_23519_oag_flight_id", using: :btree
  add_index "oag_schedules", ["dest_apt"], name: "idx_23519_index_oag_schedules_on_dest_apt", using: :btree
  add_index "oag_schedules", ["mkt"], name: "idx_23519_index_oag_schedules_on_mkt", using: :btree
  add_index "oag_schedules", ["origin_apt", "dest_apt"], name: "idx_23519_oag_comp_mkt", using: :btree
  add_index "oag_schedules", ["report_key", "eff_date", "disc_date"], name: "idx_23519_oag_eff_disc_dates", using: :btree
  add_index "oag_schedules", ["report_key", "eff_date"], name: "idx_23519_oag_eff_date", using: :btree

  create_table "report_keys", force: true do |t|
    t.text     "report_key"
    t.text     "name"
    t.text     "city"
    t.boolean  "active"
    t.text     "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "report_keys", ["report_key"], name: "idx_23530_index_report_keys_on_report_key", unique: true, using: :btree
  add_index "report_keys", ["slug"], name: "idx_23530_index_report_keys_on_slug", unique: true, using: :btree

  create_table "settings", force: true do |t|
    t.text     "var",                  null: false
    t.text     "value"
    t.integer  "thing_id",   limit: 8
    t.text     "thing_type"
    t.text     "tip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "idx_23545_index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

end
