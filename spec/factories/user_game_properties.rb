FactoryGirl.define do
  factory :user_game_property do
    value { Faker::Book.title }
    user_id {rand (1000)}
    game_property_id {rand(1000)}
  end
end
