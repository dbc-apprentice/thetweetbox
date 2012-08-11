class Link < ActiveRecord::Base
  belongs_to :tweet
  attr_accessible :url
end
