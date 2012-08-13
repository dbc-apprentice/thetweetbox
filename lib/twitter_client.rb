module TwitterClient
  class << self

    #returns only tweets with urls
    def get_tweets_with_urls(user)
      tweets = get_user_tweets(user)
      tweets.reject { |tweet| tweet["entities"]["urls"].empty? }
      tweets.each do |tweet|
         unless Tweet.find_by_twitter_id(tweet["id"].to_i)
           #save tweet in database

           new_tweet = Tweet.create(:user => user,
                          :twitter_id => tweet["id"].to_i,
                          :text => CGI.escape(tweet["text"]) )
            #save hashtag in database
            tweet["entities"]["hashtags"].each do |hashtag|
              new_tag = Hashtag.find_or_create_by_text(hashtag['text'])
              new_tag.tweets << new_tweet
            end
            #save link in database
            tweet["entities"]["urls"].each do |url|
              new_url = Link.find_or_create_by_url(url["expanded_url"])
              new_url.tweets << new_tweet
            end
         end
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