FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Sample Product #{n}" }
    description { 'Example description' }
    price { 15.67 }
    stock_quantity { 10 }
    sequence(:sku) { |n| "1234-product#{n}" }
    # sku { '1234-electronics' }
    weight { 50 }
    rating { 4 }
    listed { true }
    association :producer

    trait :clothing do
      sku { '4567-clothing' }
    end

    trait :gym_gear do
      sku { '9000-gym-gear' }
    end

    trait :out_of_stock do
      stock_quantity { 0 }
    end

    trait :with_category do
      after(:create) do |product|
        create(:product_category, product:)
      end
    end
  end
end
