# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtag < ActiveRecord::Base
  attr_accessible :text
  has_and_belongs_to_many :tweets

  # self.create_from_tweet(hashtags)
  #   hashtags.each do |twitter_hashtag|
  #     hashtag = Hashtag.new
  #     #hashtag.tweets = [tweet]
  #     unless Hashtag.find_by_text(twitter_hashtag["text"])
  #       hashtag.text = twitter_hashtag["text"]
  #     end
  #     hashtag.save
  #   end
  # end
end
