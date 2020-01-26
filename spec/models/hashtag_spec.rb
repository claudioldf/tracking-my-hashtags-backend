require 'rails_helper'

RSpec.describe Hashtag, type: :model do

  describe "#name" do
    it "name should always return # at the bening" do
      hashtag = Hashtag.new(name: "rails")
      expect(hashtag.name).to eq("#rails")

      hashtag = Hashtag.new(name: "#rails")
      expect(hashtag.name).to eq("#rails")
    end

    it "should not save without name" do
      hashtag = Hashtag.new
      expect(hashtag.save).to eq(false)
    end
  end

end
