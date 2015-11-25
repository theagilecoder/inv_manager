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

ActiveRecord::Schema.define(version: 20151125132815) do

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "item_code"
    t.string   "description"
    t.decimal  "cost"
    t.string   "location"
    t.string   "uom"
    t.decimal  "service_level"
    t.decimal  "lead_time"
    t.decimal  "lead_time_variability"
    t.decimal  "df1"
    t.decimal  "df2"
    t.decimal  "df3"
    t.decimal  "df4"
    t.decimal  "df5"
    t.decimal  "df6"
    t.decimal  "df7"
    t.decimal  "df8"
    t.decimal  "df9"
    t.decimal  "df10"
    t.decimal  "df11"
    t.decimal  "df12"
    t.decimal  "as1"
    t.decimal  "as2"
    t.decimal  "as3"
    t.decimal  "as4"
    t.decimal  "as5"
    t.decimal  "as6"
    t.decimal  "hf1"
    t.decimal  "hf2"
    t.decimal  "hf3"
    t.decimal  "hf4"
    t.decimal  "hf5"
    t.decimal  "hf6"
    t.decimal  "ordered_quantity"
    t.decimal  "actual_quantity"
    t.decimal  "mape"
    t.decimal  "bias"
    t.decimal  "supply_uncertainty"
    t.decimal  "transit_time_variability"
    t.decimal  "safety_stock"
    t.decimal  "safety_stock_1"
    t.decimal  "safety_stock_2"
    t.decimal  "safety_stock_3"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
