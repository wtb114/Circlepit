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

ActiveRecord::Schema.define(version: 20161005112255) do

  create_table "artists", force: :cascade do |t|
    t.integer  "artist_id",            limit: 4
    t.string   "artist_name",          limit: 255
    t.string   "artist_name_japanese", limit: 255
    t.text     "artist_image_url",     limit: 65535
    t.text     "artist_url",           limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "event_id",       limit: 4
    t.string   "event_name",     limit: 255
    t.datetime "event_date"
    t.string   "event_location", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "group_id",                     limit: 4
    t.string   "group_name",                   limit: 255
    t.text     "group_comment",                limit: 65535
    t.string   "group_top_image_file_name",    limit: 255
    t.string   "group_top_image_content_type", limit: 255
    t.integer  "group_top_image_file_size",    limit: 4
    t.datetime "group_top_image_updated_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

end
