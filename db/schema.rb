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

ActiveRecord::Schema.define(version: 20190712064419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end
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



  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "excess_definitions", "users"
end
