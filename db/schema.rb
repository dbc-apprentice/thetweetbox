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

ActiveRecord::Schema.define(:version => 20120811190607) do

  create_table "hashtags", :force => true do |t|
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hashtags", ["text"], :name => "index_hashtags_on_text", :unique => true

  create_table "hashtags_tweets", :id => false, :force => true do |t|
    t.integer "hashtag_id"
    t.integer "tweet_id"
  end

  add_index "hashtags_tweets", ["hashtag_id", "tweet_id"], :name => "index_hashtags_tweets_on_hashtag_id_and_tweet_id", :unique => true

  create_table "links", :force => true do |t|
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["url"], :name => "index_links_on_url", :unique => true

  create_table "links_tweets", :id => false, :force => true do |t|
    t.integer "link_id"
    t.integer "tweet_id"
  end

  add_index "links_tweets", ["link_id", "tweet_id"], :name => "index_links_tweets_on_link_id_and_tweet_id", :unique => true

  create_table "tweets", :force => true do |t|
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "twitter_id", :limit => 8
  end

  add_index "tweets", ["twitter_id"], :name => "index_tweets_on_twitter_id", :unique => true
  add_index "tweets", ["user_id"], :name => "index_tweets_on_user_id"

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
