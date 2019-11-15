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

ActiveRecord::Schema.define(version: 20191115090922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_lists", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "user_id"
    t.integer  "sale"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "check_lists", ["person_id"], name: "index_check_lists_on_person_id", using: :btree
  add_index "check_lists", ["user_id"], name: "index_check_lists_on_user_id", using: :btree

  create_table "excess_definitions", force: :cascade do |t|
    t.string   "v_value"
    t.string   "d_value"
    t.string   "i_value"
    t.string   "h_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "const"
    t.string   "min"
    t.string   "sec"
    t.integer  "user_id"
  end

  add_index "excess_definitions", ["user_id"], name: "index_excess_definitions_on_user_id", using: :btree

  create_table "file_cars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json     "avatars"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "person_id"
    t.integer  "check_list_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "price"
    t.string   "name_service"
  end

  add_index "orders", ["check_list_id"], name: "index_orders_on_check_list_id", using: :btree
  add_index "orders", ["person_id"], name: "index_orders_on_person_id", using: :btree
  add_index "orders", ["service_id"], name: "index_orders_on_service_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "mark_car"
    t.string   "model_car"
    t.string   "number_car"
    t.date     "last_visit"
    t.string   "description"
    t.string   "patronymic"
    t.string   "sex"
    t.string   "contact_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "upload"
  end

  create_table "people_file_cars", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "file_car_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "people_file_cars", ["file_car_id"], name: "index_people_file_cars_on_file_car_id", using: :btree
  add_index "people_file_cars", ["person_id"], name: "index_people_file_cars_on_person_id", using: :btree

  create_table "quick_pows", force: :cascade do |t|
    t.string   "basis"
    t.string   "exponent"
    t.string   "ring_of_residues"
    t.string   "result"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "rc4_programs", force: :cascade do |t|
    t.string   "key"
    t.string   "transient_message"
    t.string   "chanted_message"
    t.string   "message_text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "check_lists", "people"
  add_foreign_key "check_lists", "users"
  add_foreign_key "excess_definitions", "users"
  add_foreign_key "orders", "check_lists"
  add_foreign_key "orders", "people"
  add_foreign_key "orders", "services"
  add_foreign_key "people_file_cars", "file_cars"
  add_foreign_key "people_file_cars", "people"
end
