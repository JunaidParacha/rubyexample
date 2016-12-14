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

ActiveRecord::Schema.define(version: 20161214215604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "even_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["even_id"], name: "index_comments_on_even_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "evens", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "location"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "evens", ["user_id"], name: "index_evens_on_user_id", using: :btree

  create_table "joins", force: true do |t|
    t.integer  "user_id"
    t.integer  "even_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "joins", ["even_id"], name: "index_joins_on_even_id", using: :btree
  add_index "joins", ["user_id"], name: "index_joins_on_user_id", using: :btree

  create_table "logins", force: true do |t|
    t.string   "first_name"
    t.string   "Last_name"
    t.string   "email"
    t.string   "location"
    t.string   "state"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "Last_name"
    t.string   "email"
    t.string   "location"
    t.string   "state"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dob"
  end

end
