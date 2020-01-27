require 'rails_helper'

RSpec.describe Hashtag, type: :model do

  describe "#name" do
    it "should return '#' at the beginnig of a name" do
      hashtag = Hashtag.new
      hashtag.name = "ruby"
      expect(hashtag.name).to eq("#ruby")
    end

    it "should not save without name" do
      hashtag = Hashtag.new
      expect(hashtag.save).to eq(false)
    end
  end

end
