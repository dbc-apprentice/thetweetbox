class UsersController < ApplicationController
  def new
    # @hashtags = Hashtag.all(:order => "RANDOM()")
    @hashtags = Hashtag.scoped.page(params[:page]).per(5)# (:order => "RANDOM()")
  end

  def show
    @user = User.find(:first, :conditions => ["lower(twitter_name) =?", params[:twitter_name].downcase])
    @tweets = @user.tweets.order("twitter_id DESC").scoped.page(params[:page]).per(50)
    hashtags = {}
    @user.tweets.each do |tweet|
      tweet.hashtags.each do |hashtag|
        if hashtags.include?(hashtag.text)
          hashtags[hashtag.text] += 1
        else
          hashtags[hashtag.text] = 1 
        end
      end
    end
    @hashtags = Hash[hashtags.sort]

  end
  
end
