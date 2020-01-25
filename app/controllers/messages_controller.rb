class MessagesController < ApplicationController

  def index
    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    
    keywords = Hashtag.all()

    return render json: [] if keywords.blank?

    @tweets = []

    keywords.each do |keyword|
      begin 
        @twitter_response = @twitter_client.search("#{keyword.name} -rt", result_type: "recent", lang: "pt-br", count: 5)
        
        @twitter_response.each do |tweet|
          @tweets << {
            id: nil,
            username: tweet.user.screen_name,
            text: tweet.text,
            published_at: tweet.created_at,
            user: {
              followers_count: tweet.user.followers_count,
              lang: tweet.user.lang,
              profile_image_uri: tweet.user.profile_image_uri.to_s
            }
          }
        end
      rescue Twitter::Error::TooManyRequests
        return render json: [], status: :too_many_requests
      ensure
        @message = "Unable to request messages on Twitter"
      end
    end

    render json: @tweets
  end

end
