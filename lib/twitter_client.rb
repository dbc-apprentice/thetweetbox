module TwitterClient
  class << self

    #returns only tweets with urls
    def get_tweets_with_urls(user)
      tweets = get_user_tweets(user)
      tweets.reject { |tweet| tweet["entities"]["urls"].empty? }
      tweets.each do |tweet|
         tweet[:user] = user
         Tweet.create_from_twitter(tweet)
      end
    end

    private
    # connects to twitter
    def connect_to_twitter(user)
      TwitterOAuth::Client.new(
                    :consumer_key => ENV['TWITTER_KEY'],
                    :consumer_secret => ENV['TWITTER_SECRET'],
                    :token => user[:auth_token],
                    :secret => user[:auth_secret]
      )
    end

    #gets all the tweets for the user
    def get_user_tweets(user)
      client = connect_to_twitter(user)
      all_tweets = client.user_timeline(
                   "include_entities" => true,
                   "include_rts" => true,
                   "screen_name" => "#{user[:twitter_name]}",
                   "count" => 200
                    )
    end
  end
end