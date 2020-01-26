require 'spec_helper'

RSpec.describe MessagesController, type: :controller do
  before(:each) do
    FactoryBot.create(:hashtag, name: "ruby")
    FactoryBot.create(:hashtag, name: "rails")
  end

  describe "GET #index" do
    it "should get tweets lists" do
      skip """
      Find a way to fix 'Twitter::Error::BadRequest: Bad Authentication data'. 
      Even the authntication parameters is correct, when call 'get :index, as: :json' through rspec we get this error.
      However when you access the same route on browser it works correctly.
      """

      # get messages_url, as: :json
      # expect(response).to be_successful 
    end
  end
end
