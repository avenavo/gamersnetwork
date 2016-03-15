FactoryGirl.define do
  factory :closed_value do
    game_property_id { rand(1000) }
    value { Faker::Book.title }
  end
end
