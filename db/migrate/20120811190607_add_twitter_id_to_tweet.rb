class AddTwitterIdToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :twitter_id, :bigint
    add_index :tweets, :twitter_id, :unique => true
  end
end
