class UsersController < ApplicationController
  def new
    @hashtags = Hashtag.all(:order => "RANDOM()")
  end

  def show

  end
end
