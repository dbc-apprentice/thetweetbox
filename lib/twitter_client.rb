module TwitterClient
  class << self
    
    #get tweets for all users
    def get_users_tweets
      User.all.each { |user| get_tweets(user) }
    end
        
    #get tweets for a specified user
    def get_tweets(user)
      tweets_with_url(user).each do |tweet|
         unless Tweet.find_by_twitter_id(tweet["id"].to_i)
           new_tweet = create_new_tweet(tweet: tweet, user: user)
           options = {tweet_entities: tweet['entities'], new_tweet: new_tweet}
           create_new_hashtags(options)
           create_new_links(options)
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
    
    #returns only tweets with urls for the specified user
    def tweets_with_url(user)
      tweets = get_user_tweets(user)
      tweets.reject { |tweet| tweet["entities"]["urls"].empty? }
    end
    
    def create_new_tweet(options = {})
      Tweet.create(:user => options[:user],
                   :twitter_id => options[:tweet]["id"].to_i,
                   :text => CGI.escape(options[:tweet]["text"])
      )
    end
    
    def create_new_hashtags(options = {})
      #save hashtags in database
      options[:tweet_entities]["hashtags"].each do |hashtag|
        new_tag = Hashtag.find_or_create_by_text(hashtag['text'].downcase)
        new_tag.tweets << options[:new_tweet]
      end
    end
    
    def create_new_links(options = {})
      #save link in database
      options[:tweet_entities]["urls"].each do |url|
        new_url = Link.find_or_create_by_url(url["expanded_url"])
        new_url.tweets << options[:new_tweet]
      end
    end
    
  end
end