class CreateLinksTweets < ActiveRecord::Migration
  def change
    create_table :links_tweets, :id => false do |t|
      t.references :link
      t.references :tweet
    end

    add_index(:links_tweets, [:link_id, :tweet_id], :unique => true)
  end
end
