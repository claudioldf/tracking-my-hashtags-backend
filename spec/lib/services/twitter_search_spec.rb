require 'spec_helper'
require 'twitter'
require_relative "../../../config/initializers/twitter.rb"
require_relative "../../../lib/services/twitter_search.rb"

describe Services::TwitterSearch do

  describe "#search_by_hashtags" do
    before(:each) do
      # Mock: Twitter::User
      @fakeTweetUser = double(Twitter::User)
      allow(@fakeTweetUser).to receive(:screen_name).and_return "@tester"
      allow(@fakeTweetUser).to receive(:followers_count).and_return 700
      allow(@fakeTweetUser).to receive(:profile_image_uri).and_return "http://pbs.twimg.com/profile_images/1204131757534171136/Hdf5uixg_normal.png"

      # Mock: Twitter::Tweet
      @fakeTweet = double(Twitter::Tweet)
      allow(@fakeTweet).to receive(:text).and_return "Hellow world #ruby #rails"
      allow(@fakeTweet).to receive(:created_at).and_return "2020-01-26 00:31:22 UTC"
      allow(@fakeTweet).to receive(:user).and_return @fakeTweetUser

      # Mock: Twitter::REST::Client
      fakeTwitterClient = double(Twitter::REST::Client)
      allow(fakeTwitterClient).to receive(:new).and_return fakeTwitterClient
      allow(fakeTwitterClient).to receive(:search).and_return [@fakeTweet]

      @twitter = Services::TwitterSearch.new(fakeTwitterClient)
    end

    it "should match the struture" do      
      tweet = @twitter.search_by_hashtags(["#ruby", "#rails"]).first
      tweet_keys = tweet.keys
      tweet_user_keys = tweet[:user].keys

      expect(tweet[:screen_name]).to eq @fakeTweetUser.screen_name
      expect(tweet[:text]).to eq @fakeTweet.text
      expect(tweet[:published_at]).to eq @fakeTweet.created_at
      expect(tweet[:user][:followers_count]).to eq @fakeTweetUser.followers_count
      expect(tweet[:user][:profile_image_uri]).to eq @fakeTweetUser.profile_image_uri.to_s
    end

    it "must include at least one hashtag on message text" do
      @twitter.search_by_hashtags(["#ruby", "#rails"]).filter{|tweet|
        expect(tweet[:text].match? /(#ruby|#rails)/).to eq true
      }
    end
  end

end