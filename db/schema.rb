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

ActiveRecord::Schema.define(version: 2020_03_23_214519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "annual_prod"
    t.integer "world_rank"
    t.string "world_market_share"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_process_links", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "drying_process_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_country_process_links_on_country_id"
    t.index ["drying_process_id"], name: "index_country_process_links_on_drying_process_id"
  end

  create_table "drying_processes", force: :cascade do |t|
    t.string "name"
    t.text "process_time"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "harvest_periods", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "month_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_harvest_periods_on_country_id"
    t.index ["month_id"], name: "index_harvest_periods_on_month_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mutations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.bigint "variety_id"
    t.bigint "parent_variety_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variety_id"], name: "index_parents_on_variety_id"
  end

  create_table "productive_countries", force: :cascade do |t|
    t.bigint "variety_id"
    t.bigint "country_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_productive_countries_on_country_id"
    t.index ["variety_id"], name: "index_productive_countries_on_variety_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "varieties", force: :cascade do |t|
    t.string "name"
    t.boolean "arabica"
    t.boolean "robusta"
    t.integer "discover_year"
    t.string "origin"
    t.string "altitude"
    t.bigint "mutation_id"
    t.text "plant"
    t.text "strenght"
    t.text "cup"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mutation_id"], name: "index_varieties_on_mutation_id"
  end

  add_foreign_key "country_process_links", "countries"
  add_foreign_key "country_process_links", "drying_processes"
  add_foreign_key "harvest_periods", "countries"
  add_foreign_key "harvest_periods", "months"
  add_foreign_key "parents", "varieties"
  add_foreign_key "productive_countries", "countries"
  add_foreign_key "productive_countries", "varieties"
  add_foreign_key "varieties", "mutations"
end
