require 'spec_helper'

describe TwitterClient do

  context "gets all the tweets with urls for the user" do
    let(:user) do
      { auth_token: "398173256-atW28FF5XpkglQMkypIqfgJGqMDs1L4OnnQqaPtR",
        auth_secret: "97pfLOOgODzW0KAfEinBbp6Lc2qX9UQ6hvgpf9ANsbI",
        twitter_name: "NatashaTheRobot"
      }
    end

    it "returns all tweets with urls" do
      tweets = TwitterClient.get_tweets_with_urls(user)
      tweets.first["urls"]["entities"].should_not be_empty
    end

  end

end