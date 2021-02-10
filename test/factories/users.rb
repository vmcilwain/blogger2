FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'somepassword' }
    password_confirmation { 'somepassword' }
    confirmed_at { Time.now }
  end
end
