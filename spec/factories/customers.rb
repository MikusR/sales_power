FactoryBot.define do
  factory :customer do
    association(:user)
    sequence(:first_name, 1) { |n| "Customer#{n}" }
    sequence(:last_name, 1) { |n| "Surname#{n}" }
    cash_checkout

    trait :cash_checkout do
      default_checkout_method { 'cash' }
    end

    trait :card_checkout do
      default_checkout_method { 'card' }
    end
  end
end
