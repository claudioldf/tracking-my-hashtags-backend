class Hashtag < ApplicationRecord
  validates_presence_of :name
  
  def name
    "\##{super()}" unless super.blank?
  end

end
