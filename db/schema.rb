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

ActiveRecord::Schema.define(version: 20170120064031) do

  create_table "artists", force: :cascade do |t|
    t.string   "artist_name",          limit: 255
    t.string   "artist_name_japanese", limit: 255
    t.text     "artist_image_url",     limit: 65535
    t.text     "artist_url",           limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id",              limit: 4
  end

  create_table "clips", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "event_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "clips", ["event_id"], name: "index_clips_on_event_id", using: :btree
  add_index "clips", ["user_id"], name: "index_clips_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "tweet_id",   limit: 4
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name",     limit: 255
    t.datetime "event_date"
    t.string   "event_location", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id",        limit: 4
    t.integer  "artist_id",      limit: 4
    t.integer  "artist_id2",     limit: 4
    t.integer  "artist_id3",     limit: 4
    t.integer  "artist_id4",     limit: 4
    t.integer  "artist_id5",     limit: 4
    t.integer  "artist_id6",     limit: 4
    t.integer  "artist_id7",     limit: 4
    t.integer  "artist_id8",     limit: 4
    t.integer  "artist_id9",     limit: 4
    t.integer  "artist_id10",    limit: 4
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "artist_id",  limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "favorites", ["artist_id"], name: "index_favorites_on_artist_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "group_name",                   limit: 255
    t.text     "group_comment",                limit: 65535
    t.string   "group_top_image_file_name",    limit: 255
    t.string   "group_top_image_content_type", limit: 255
    t.integer  "group_top_image_file_size",    limit: 4
    t.datetime "group_top_image_updated_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id",  limit: 4
    t.integer  "following_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  add_index "relationships", ["following_id"], name: "index_relationships_on_following_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.text     "text",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "family_name",            limit: 255
    t.string   "first_name",             limit: 255
    t.string   "family_name_kana",       limit: 255
    t.string   "first_name_kana",        limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "username",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
    t.date     "birthday"
    t.string   "hometown",               limit: 255
    t.string   "location",               limit: 255
    t.string   "gender",                 limit: 255
    t.string   "comment",                limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
