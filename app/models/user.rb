class User < ActiveRecord::Base
  attr_accessible :auth_secret, :auth_token, :image_url, :name, :twitter_name, :uid

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.twitter_name = auth["info"]["nickname"]
      user.image_url = auth["info"]["image"]
      user.auth_token = auth["credentials"]["token"]
      user.auth_secret = auth["credentials"]["secret"]
    end
  end

end
