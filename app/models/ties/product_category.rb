class Ties::ProductCategory < ApplicationRecord
  self.table_name = :product_categories

  belongs_to :product, inverse_of: :ties_to_categories
  belongs_to :category, inverse_of: :ties_to_products
end
