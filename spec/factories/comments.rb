FactoryGirl.define do
  factory :comment do
    comment { Faker::Lorem.characters(rand(500)) }
    user_id  { rand(1000) }
    post_id  { rand(1000) }
  end
end
