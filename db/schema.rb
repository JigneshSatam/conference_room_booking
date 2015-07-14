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

ActiveRecord::Schema.define(version: 20150714052457) do

  create_table "bookings", force: true do |t|
    t.integer  "rooms_id"
    t.integer  "timeslots_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookings", ["rooms_id"], name: "index_bookings_on_rooms_id"
  add_index "bookings", ["timeslots_id"], name: "index_bookings_on_timeslots_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "rooms", force: true do |t|
    t.integer  "room_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timeslots", force: true do |t|
    t.date     "booking_date"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
