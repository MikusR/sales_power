class Producer < ApplicationRecord
  has_many :products, inverse_of: :producer, dependent: :destroy

  validates :name, :founding_year, presence: true
  validates :name, uniqueness: true
  validates :founding_year, numericality: { in: 1965.. }
end
