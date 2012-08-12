module TwitterClient
  module Parser
    class << self
      def parse(tweets)
        tweets.reject { |tweet| tweet["entities"]["urls"].empty? }
      end
    end

    private

    def extract_urls
    end
  end

end