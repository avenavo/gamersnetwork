FactoryGirl.define do
  factory :friendship do
    user_id { rand(1000) }
    friend_id { rand(1000) }
    status {"false"}
  end
end
