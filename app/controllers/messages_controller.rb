require "#{Rails.root}/lib/services/twitter_search.rb"

class MessagesController < ApplicationController

  def index
    if params[:hashtags].present?
      hashtags = params[:hashtags]
    else
      hashtags = Hashtag.all.pluck(:name)
    end

    return render json: [] if hashtags.blank?

    @tweets = []

    begin 
      @twitter = Services::TwitterSearch.new(Twitter::REST::Client.new)
      @tweets = @twitter.search_by_hashtags(hashtags)
    rescue Twitter::Error::TooManyRequests
      return render json: [], status: :too_many_requests
    end

    render json: @tweets
  end

end
