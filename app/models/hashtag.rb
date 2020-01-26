class Hashtag < ApplicationRecord
  validates_presence_of :name
  
  def name
    "\##{super().gsub("#", "")}" unless super.blank?
  end

end
