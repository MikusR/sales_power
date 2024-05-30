FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Sample Product #{n}" }
    description { 'Example description' }
    price { 15.67 }
    stock_quantity { 10 }
    sku { '1234-electronics' }
    weight { 50 }
    rating { 4 }
    listed { true }

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
