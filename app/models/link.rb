# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Link < ActiveRecord::Base
  attr_accessible :url
  has_and_belongs_to_many :tweets

  def self.create_from_url(url)
    link = Link.new
    link.tweets = [url[:tweet]]
    unless Link.find_by_url(url["expanded_url"])
      link.url = url["expanded_url"]
    end
    link.save
  end
end
