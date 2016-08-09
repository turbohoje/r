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

ActiveRecord::Schema.define(version: 20140522143714) do

  create_table "customers", force: :cascade do |t|
    t.string   "customer_id", limit: 255
    t.string   "zip",         limit: 255
    t.float    "lat",         limit: 24
    t.float    "long",        limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["customer_id"], name: "index_customers_on_customer_id", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "store_id",    limit: 4
    t.string   "customer_id", limit: 255
    t.float    "lat",         limit: 24
    t.float    "long",        limit: 24
    t.datetime "event_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["customer_id"], name: "index_events_on_customer_id", using: :btree
  add_index "events", ["store_id"], name: "index_events_on_store_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.text     "terms",       limit: 65535
    t.string   "image_url",   limit: 255
    t.datetime "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retailers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: :cascade do |t|
    t.integer  "retailer_id", limit: 4
    t.string   "address",     limit: 255
    t.string   "city",        limit: 255
    t.string   "state",       limit: 255
    t.string   "zip",         limit: 255
    t.float    "lat",         limit: 24
    t.float    "long",        limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["retailer_id"], name: "index_stores_on_retailer_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.integer  "offer_id",      limit: 4
    t.string   "task_type",     limit: 255
    t.float    "amount",        limit: 24
    t.text     "content",       limit: 65535
    t.string   "url",           limit: 255
    t.string   "thumbnail_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["offer_id"], name: "index_tasks_on_offer_id", using: :btree

end
