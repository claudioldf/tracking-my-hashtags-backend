require 'rails_helper'

RSpec.describe Hashtag, type: :model do

  describe "#name" do
    it "should not save without name" do
      hashtag = Hashtag.new
      expect(hashtag.save).to eq(false)
    end
  end

end
