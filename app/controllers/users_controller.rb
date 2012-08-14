class UsersController < ApplicationController
  def new
    # @hashtags = Hashtag.all(:order => "RANDOM()")
    @hashtags = Hashtag.scoped.page(params[:page]).per(10)# (:order => "RANDOM()")
  end

  def show
    @user = User.find(:first, :conditions => ["lower(twitter_name) =?", params[:twitter_name].downcase])
    @tweets = @user.tweets.order("created_at ASC")
    hashtags = []
    @user.tweets.each do |tweet|
      tweet.hashtags.each do |hashtag|
        hashtags << hashtag.text unless hashtags.include?(hashtag.text)
      end
    end
    @hashtags = hashtags.sort
    puts "$" * 100
    puts @hashtags.inspect
  end
end
