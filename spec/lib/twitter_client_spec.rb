require 'spec_helper'

describe TwitterClient do

  context "connects to Twitter"

  describe TwitterClient::Parser do
    let(:tweet1) do
      {
        "text" => "New section to Twitter Cards documentation: Player Card checklist  http:\/\/t.co\/hMugaw5W please review before submitting your Player Card ^SC",
        "entities"=> { "hashtags"=> [],
                       "urls"=> [{
                                  "url"=> "http:\/\/t.co\/hMugaw5W",
                                  "expanded_url"=> "http:\/\/bit.ly\/NerqPl",
                                  "display_url"=> "bit.ly\/NerqPl",
                                  }]
                    }
      }
    end

    let(:tweet2) do
      {
        "text" => "This is another fun tweet",
        "entities"=> { "hashtags"=> [{ "text" => "TDD"},
                                     { "text" => "Ruby"}],
                       "urls"=> []
                     }
      }

    end

    subject { TwitterClient::Parser }
    it { should respond_to :parse }
    it "returns only tweets that have urls" do
      TwitterClient::Parser.parse([tweet1, tweet2]).should eq [tweet1]
    end
  end
end