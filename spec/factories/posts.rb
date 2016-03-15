FactoryGirl.define do
  factory :post do
    post { Faker::Hipster.paragraphs }
    user_id  { rand(1000) }
  end
end
