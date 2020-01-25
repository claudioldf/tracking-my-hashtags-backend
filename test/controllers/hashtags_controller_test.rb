require 'test_helper'

class HashtagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hashtag = hashtags(:one)
  end

  test "should get index" do
    get hashtags_url, as: :json
    assert_response :success
  end

  test "should create hashtag" do
    assert_difference('Hashtag.count') do
      post hashtags_url, params: { hashtag: { name: "mytest" } }, as: :json
    end

    assert_response 201
  end

  test "should show hashtag" do
    get hashtag_url(@hashtag), as: :json
    assert_response :success
  end

  test "should update hashtag" do
    patch hashtag_url(@hashtag), params: { hashtag: { name: "mytest2" } }, as: :json

    json_response = JSON.parse(response.body)

    assert_equal "#mytest2", json_response["name"]
    assert_response 200
  end

  test "should not update an invalid hashtag" do
    patch hashtag_url(@hashtag), params: { hashtag: {  } }, as: :json

    json_response = JSON.parse(response.body)

    assert_equal @hashtag.name, json_response["name"]
    assert_response 200
  end

  test "should destroy hashtag" do
    assert_difference('Hashtag.count', -1) do
      delete hashtag_url(@hashtag), as: :json
    end

    assert_response 204
  end
end
