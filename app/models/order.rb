class Order < ApplicationRecord
  enum status: { placed: 0, gathering: 1, shipped: 2, delivered: 3 }

  belongs_to :customer, inverse_of: :orders

  validates :status, :total, presence: true
end
