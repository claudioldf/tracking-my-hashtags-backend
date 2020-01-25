require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messages_url, as: :json
    assert_response :success
  end

  test "should get index filtering by hashtags" do
    get messages_url(hashtags: ['rails', 'ruby']), as: :json

    assert response.body.include?('#rails')
    assert response.body.include?('#ruby')
  end
end
