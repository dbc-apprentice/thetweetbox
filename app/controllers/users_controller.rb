class UsersController < ApplicationController
  def new
    @hashtags = Hashtag.all(:order => "RANDOM()")
  end

  def show
    @user = User.find(:first, :conditions => ["lower(twitter_name) =?", params[:twitter_name].downcase])
    @tweets = @user.tweets.order("created_at ASC")
  end
end
