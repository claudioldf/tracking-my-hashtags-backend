require "#{Rails.root}/lib/services/twitter_search.rb"

class MessagesController < ApplicationController

  def index
    hashtags = Hashtag.all()

    return render json: [] if hashtags.blank?

    @tweets = []

    begin 
      @twitter = Services::TwitterSearch.new(Twitter::REST::Client)
      @tweets = @twitter.search_by_hashtags(hashtags.map{|hashtag| hashtag.name})
    rescue Twitter::Error::TooManyRequests
      return render json: [], status: :too_many_requests
    end

    render json: @tweets
  end

end
