FactoryGirl.define do
  factory :game_property do
    name { Faker::Book.title }
    game_id { rand(1000) }
  end
end
