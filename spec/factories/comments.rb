FactoryBot.define do
  factory :comment do
    association(:manager)
    for_product
    sequence(:content, 1) { |n| "Example comment #{n}" }

    trait :for_product do
      association(:topic, factory: :product)
    end
  end
end
