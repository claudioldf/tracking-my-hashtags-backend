require 'spec_helper'

RSpec.describe MessagesController, type: :controller do
  before(:each) do
    FactoryBot.create(:hashtag, name: "ruby")
    FactoryBot.create(:hashtag, name: "rails")
  end

  describe "GET #index" do
    it "should get tweets lists", :vcr do
      get :index, as: :json

      json = JSON.parse(response.body)[0]
      json_keys = json.keys
      json_user_keys = json["user"].keys
      
      expect(json_keys).to eq ["screen_name", "text", "published_at", "user"]
      expect(json_user_keys).to eq ["followers_count", "profile_image_uri"]
      expect(response).to be_successful 
    end

    it "should get an empty lists filtering by an invalid hashtag", :vcr do
      get :index, params: {hashtags: ["inexistinghashtagfortestingemptylist"]}, as: :json

      expect(JSON.parse(response.body)).to eq []
      expect(response).to be_successful 
    end
  end
end
