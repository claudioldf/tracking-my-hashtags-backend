module Services 
  
  class TwitterSearch

    def initialize(adapter)
      @adapter = adapter
      @adapter.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      @adapter.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      @adapter.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      @adapter.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      @adapter.configuration
    end

    def search_by_hashtags(hashtags = [])
      @results = []

      query = "#{words_to_hashtags_format(hashtags).join(" OR ")} -rt"

      @response = @adapter.search(query, result_type: "recent", lang: "pt-br", count: 5)

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

    private

    def words_to_hashtags_format(hashtags)
      hashtags.map{ |hashtag|
        hashtag = '#' + hashtag unless hashtag[0] == '#'
        hashtag
      }
    end
  end

end