FactoryBot.define do
  factory :product_category, class: 'Ties::ProductCategory' do
    association(:product)
    association(:category)
  end
end
