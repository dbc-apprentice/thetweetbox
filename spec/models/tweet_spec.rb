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

require 'spec_helper'

describe Tweet do
 it { should belong_to :user }
 it { should have_and_belong_to_many :hashtags }
 it { should have_and_belong_to_many :links }
end
