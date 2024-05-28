class Customer < ApplicationRecord
  enum default_checkout_method: { cash: 0, card: 1, paypal: 2 }

  belongs_to :user, inverse_of: :customer
  has_many :orders, inverse_of: :customer, dependent: :destroy

  validates :first_name, :last_name, :default_checkout_method, presence: true
end
