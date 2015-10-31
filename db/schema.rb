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

ActiveRecord::Schema.define(version: 20151014034530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "addresses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "person_id"
    t.string   "street"
    t.integer  "number"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "complement"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["person_id"], name: "index_addresses_on_person_id", using: :btree

  create_table "people", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "registry"
    t.string   "sex"
    t.string   "phone"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "token"
    t.string   "activation_token"
    t.boolean  "active",                     default: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "last_password_retrieval_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
