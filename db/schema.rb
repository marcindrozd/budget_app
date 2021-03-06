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

ActiveRecord::Schema.define(version: 20150221205739) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total"
    t.integer  "user_id"
    t.string   "currency"
    t.string   "slug"
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "name"
    t.string   "recurrence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount"
    t.integer  "account_id"
    t.datetime "due_date"
    t.integer  "month_id"
    t.boolean  "paid",       default: false
    t.string   "related_to"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
