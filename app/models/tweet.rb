# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  twitter_id :integer
#

class Tweet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text, :twitter_id
  has_and_belongs_to_many :hashtags
  has_and_belongs_to_many :links

  def self.create_from_twitter(twitter_tweet)
    unless twitter_tweet["entities"]["urls"].empty?
      unless Tweet.find_by_twitter_id(twitter_tweet["id"].to_i)
        last_tweet = create! do |tweet|
          tweet.user = twitter_tweet[:user]
          tweet.twitter_id = twitter_tweet["id"].to_i
          tweet.text = CGI.escape(twitter_tweet["text"])
        end

        #create a new link
        twitter_tweet["entities"]["urls"].each do |url|
          url[:tweet] = last_tweet
          Link.create_from_url(url)
        end


        #create a new hashtag if there are any
        unless twitter_tweet["entities"]["hashtags"].empty?
          twitter_tweet["entities"]["hashtags"].each do |hashtag|
            hashtag[:tweet] = last_tweet
            Hashtag.create_from_tweet(hashtag)
          end
        end

      end
    end

  end
end
