class Tweet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text
end
