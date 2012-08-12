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

require 'spec_helper'

describe User do
  it { should have_many :tweets }

  describe 'creation' do
    context 'with OmniAuth' do
      let :auth_response do
        { "uid" => (1..8).collect { rand(10) }.join,
          "info" => { "name"      => "Team TweetBox",
                      "nickname"  => "TheTweetBox",
                      "image"     => "image.com/eoiru"  },
          "credentials" => { "token" => (0...20).map{97.+(rand(25)).chr}.join,
                             "secret" => (0...30).map{97.+(rand(25)).chr}.join }
        }
      end

      subject{ User.create_with_omniauth(auth_response) }
      it { should be_persisted }

    end
  end
end
