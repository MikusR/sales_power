FactoryBot.define do
  factory :manager do
    association(:user)
    sequence(:first_name, 1) { |n| "Manager#{n}" }
    sequence(:last_name, 1) { |n| "Surname#{n}" }
    region { 'east' }
  end
end
