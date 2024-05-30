FactoryBot.define do
  factory :order do
    association(:customer)
    placed # gathering: 1, shipped: 2, delivered: 3
    total { 16.78 }
  end
end
