FactoryBot.define do
  factory :role do
    sequence(:name) { |n| "role#{n}" }
  end

  factory :admin_role, parent: :role do
    name { 'administrator' }
  end
end
