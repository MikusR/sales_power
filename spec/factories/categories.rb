FactoryBot.define do
  factory :category do
    sequence(:name, 1) { |n| "category#{n}" }
    description { 'Description for test category.' }
  end
end
