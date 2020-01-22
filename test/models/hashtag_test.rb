require 'test_helper'

class HashtagTest < ActiveSupport::TestCase

  test "name should always return # at the bening" do
    hashtag = Hashtag.new(name: "rails")
    
    assert_equal "#rails", hashtag.name
  end

  test "should not save without name" do
    hashtag = Hashtag.new

    assert_not hashtag.save
  end
end
