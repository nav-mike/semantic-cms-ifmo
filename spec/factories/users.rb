FactoryGirl.define do
  factory :user do
    sequence(:email) { Faker::Internet.email }
    password '12345678'

    factory :admin do
      after(:create) { |user| user.add_role :admin }
    end
  end
end
