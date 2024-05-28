class Category < ApplicationRecord
  has_many :ties_to_products, class_name: 'Ties::ProductCategory', inverse_of: :category, dependent: :destroy
  has_many :products, through: :ties_to_products

  validates :name, :description, presence: true, length: { minimum: 3 }
end
