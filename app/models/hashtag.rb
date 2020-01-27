class Hashtag < ApplicationRecord
  # Validations
  validates_presence_of :name

  def name
    value = super
    value = "#" + value.gsub('#', '') if value.present?
    value
  end
end
