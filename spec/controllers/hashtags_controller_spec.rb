require 'spec_helper'

RSpec.describe HashtagsController, type: :controller do

  describe "GET #index" do
    it "should list all hashtags" do
      @expected = [
        FactoryBot.create(:hashtag, name: "ruby"),
        FactoryBot.create(:hashtag, name: "rails")
      ].to_json

      get :index, as: :json

      expect(response).to have_http_status(200)
      response.body.should == @expected
    end
  end

  describe "POST #create" do
    it "should create a new hashtags" do
      @hashtag = {
        hashtag: {
          name: "ruby"
        }
      }

      expect do
        post :create, params: @hashtag, as: :json
      end.to change{ Hashtag.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE #destroy" do
    it "should destroy an existing hashtags" do
      @hashtag = FactoryBot.create(:hashtag, name: "ruby")

      expect do
        post :destroy, params: {id: @hashtag.id}, as: :json
      end.to change{ Hashtag.count }.from(1).to(0)

      expect(response).to have_http_status(:success)
    end
  end

end
