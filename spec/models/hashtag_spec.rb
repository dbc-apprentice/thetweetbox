# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Hashtag do
  it { should have_and_belong_to_many :tweets }
end
