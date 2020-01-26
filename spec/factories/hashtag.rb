FactoryBot.define do

  factory :hashtag do
    sequence( :id ) { |n| "#{n}" }
    name {"ruby"}
  end

end