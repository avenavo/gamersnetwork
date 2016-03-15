FactoryGirl.define do
  factory :game do
    name { Faker::Book.title }
  end
end
