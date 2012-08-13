# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  twitter_id :integer
#

class Tweet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text, :twitter_id, :user
  has_and_belongs_to_many :hashtags
  has_and_belongs_to_many :links
  validates_uniqueness_of :twitter_id


end
