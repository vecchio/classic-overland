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

ActiveRecord::Schema.define(version: 20160108144651) do

  create_table "cars", force: :cascade do |t|
    t.string   "no",             limit: 255
    t.integer  "stage",          limit: 4
    t.string   "make",           limit: 255
    t.string   "model",          limit: 255
    t.string   "name",           limit: 255
    t.string   "sell_name",      limit: 255
    t.string   "short",          limit: 255
    t.string   "long",           limit: 255
    t.string   "year",           limit: 255
    t.string   "register",       limit: 255
    t.string   "vin",            limit: 255
    t.string   "engine",         limit: 255
    t.string   "seller",         limit: 255
    t.date     "bought"
    t.decimal  "price",                      precision: 10
    t.date     "enatis"
    t.decimal  "enatis_cost",                precision: 10
    t.string   "plate",          limit: 255
    t.date     "police"
    t.string   "police_comment", limit: 255
    t.date     "dot"
    t.date     "exporter"
    t.decimal  "ship_cost",                  precision: 10
    t.decimal  "refurb_cost",                precision: 10
    t.date     "usa_arrive"
    t.decimal  "usa_ask",                    precision: 10
    t.decimal  "usa_price",                  precision: 10
    t.date     "usa_sold"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "pics", force: :cascade do |t|
    t.string   "picable_type",       limit: 255
    t.integer  "picable_id",         limit: 4
    t.string   "name",               limit: 255
    t.string   "caption",            limit: 255
    t.boolean  "is_landscape",                   default: true
    t.integer  "stage",              limit: 4,   default: 9
    t.boolean  "is_active",                      default: true
    t.boolean  "is_signature",                   default: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "pics", ["picable_id", "picable_type"], name: "index_pics_on_picable_id_and_picable_type", using: :btree
  add_index "pics", ["picable_type", "picable_id"], name: "index_pics_on_picable_type_and_picable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
