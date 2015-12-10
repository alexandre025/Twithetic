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

ActiveRecord::Schema.define(version: 20151204203630) do

  create_table "assets", force: :cascade do |t|
    t.integer  "viewable_id",             limit: 4
    t.string   "viewable_type",           limit: 255
    t.string   "type",                    limit: 255
    t.text     "alt",                     limit: 65535
    t.integer  "attachment_width",        limit: 4
    t.integer  "attachment_height",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "message",    limit: 65535, null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.integer  "post_id",    limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",   limit: 4,                   null: false
    t.string   "followable_type", limit: 255,                 null: false
    t.integer  "follower_id",     limit: 4,                   null: false
    t.string   "follower_type",   limit: 255,                 null: false
    t.boolean  "blocked",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "hashtags", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.integer  "mention",    limit: 4,   default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hashtags", ["name"], name: "index_hashtags_on_name", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "message",    limit: 65535, null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id",  limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "username",               limit: 255,                null: false
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.text     "bio",                    limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
