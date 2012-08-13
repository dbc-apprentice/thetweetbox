class UsersController < ApplicationController
  def new
    @hashtags = Hashtag.all
  end

  def show

  end
end
