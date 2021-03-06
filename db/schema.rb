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

ActiveRecord::Schema.define(version: 20141020155616) do

  create_table "posts", force: true do |t|
    t.string   "url"
    t.string   "embed_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_type"
    t.string   "title"
    t.string   "artist"
    t.text     "description"
    t.string   "artist_url"
    t.integer  "popularity",  default: 0, null: false
    t.string   "post_type"
    t.string   "artwork_url"
  end

  create_table "ratings", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "score",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["post_id"], name: "index_ratings_on_post_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "reviews", force: true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "draft",      default: false
  end

  add_index "reviews", ["post_id"], name: "index_reviews_on_post_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               default: "", null: false
    t.integer  "role",                   default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.string   "direction"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
