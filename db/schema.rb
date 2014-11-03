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

ActiveRecord::Schema.define(version: 20141103011920) do

  create_table "admins", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "name",       limit: 25
    t.string   "address",    limit: 50
    t.integer  "age"
    t.string   "diagnosis",  limit: 50
    t.string   "status"
    t.integer  "ward_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wards", force: true do |t|
    t.string   "name",       limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
