FactoryBot.define do
  factory :producer do
    sequence(:name) { |n| "Producer #{n}" }
    description { 'description' }
    founding_year { 1976 }
  end
end
