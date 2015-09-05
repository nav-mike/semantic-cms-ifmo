FactoryGirl.define do
  factory :setting do
    sequence(:key) { Faker::Lorem.word }
    sequence(:value) { Faker::Lorem.word }
  end
end
