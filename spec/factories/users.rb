FactoryBot.define do
  factory :user do
    sequence(:email, 1) { |n| "email#{n}@example.com" }
    password { 'strong_password_123$%^' }
  end
end
