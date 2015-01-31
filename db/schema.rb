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

ActiveRecord::Schema.define(version: 20150131001259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markers", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "end_time"
    t.integer  "truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "markers", ["truck_id"], name: "index_markers_on_truck_id", using: :btree

  create_table "preference_lists", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "preference_lists", ["user_id"], name: "index_preference_lists_on_user_id", using: :btree

  create_table "truck_accounts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.string   "twitter_handle"
    t.string   "yelp_id"
    t.string   "yelp_ratings"
    t.string   "tweet_most_recent"
    t.integer  "truck_account_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "trucks", ["truck_account_id"], name: "index_trucks_on_truck_account_id", using: :btree

  create_table "trucks_users", id: false, force: :cascade do |t|
    t.integer "truck_id"
    t.integer "user_id"
  end

  add_index "trucks_users", ["truck_id"], name: "index_trucks_users_on_truck_id", using: :btree
  add_index "trucks_users", ["user_id"], name: "index_trucks_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "yelp_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "markers", "trucks"
  add_foreign_key "preference_lists", "users"
  add_foreign_key "trucks", "truck_accounts"
end
