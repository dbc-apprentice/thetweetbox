class CreateHashtagsTweets < ActiveRecord::Migration
  def change
    create_table :hashtags_tweets, :id => false do |t|
      t.references :hashtag
      t.references :tweet
    end

    add_index(:hashtags_tweets, [:hashtag_id, :tweet_id], :unique => true)
  end
end
