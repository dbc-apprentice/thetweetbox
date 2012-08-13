# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  uid          :string(255)
#  name         :string(255)
#  image_url    :string(255)
#  twitter_name :string(255)
#  auth_token   :string(255)
#  auth_secret  :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


class User < ActiveRecord::Base
  include TwitterClient
  attr_accessible :auth_secret, :auth_token, :image_url, :name, :twitter_name, :uid
  has_many :tweets

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid =  auth["uid"]
      user.name = auth["info"]["name"]
      user.twitter_name = auth["info"]["nickname"]
      user.image_url    = auth["info"]["image"]
      user.auth_token   = auth["credentials"]["token"]
      user.auth_secret  = auth["credentials"]["secret"]
    end
  end

end