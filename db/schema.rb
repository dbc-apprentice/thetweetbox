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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120810215934) do

  create_table "users", :force => true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "image_url"
    t.string   "twitter_name"
    t.string   "auth_token"
    t.string   "auth_secret"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "users", ["auth_secret"], :name => "index_users_on_auth_secret", :unique => true
  add_index "users", ["auth_token"], :name => "index_users_on_auth_token", :unique => true
  add_index "users", ["image_url"], :name => "index_users_on_image_url", :unique => true
  add_index "users", ["twitter_name"], :name => "index_users_on_twitter_name", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid", :unique => true

end
