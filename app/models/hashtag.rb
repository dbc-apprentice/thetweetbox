# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtag < ActiveRecord::Base
  attr_accessible :text
  has_and_belongs_to_many :tweets
  validates_uniqueness_of :text
end
