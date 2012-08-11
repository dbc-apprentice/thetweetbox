class Hashtag < ActiveRecord::Base
  belongs_to :tweet
  attr_accessible :text
end
