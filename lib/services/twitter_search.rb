module Services 
  
  class TwitterSearch

    def initialize(adapter)
      @adapter = adapter.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end

    def search_by_hashtags(hashtags = [])
      @results = []

      @response = @adapter.search("#{hashtags.join(" OR ")} -rt", result_type: "recent", lang: "pt-br", count: 5)

      @response.each do |tweet|
        @results << {
          screen_name: tweet.user.screen_name,
          text: tweet.text,
          published_at: tweet.created_at,
          user: {
            followers_count: tweet.user.followers_count,
            profile_image_uri: tweet.user.profile_image_uri.to_s
          }
        }
      end

      @results
    end

  end

end