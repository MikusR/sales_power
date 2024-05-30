class AddProductCategoryUniquenessIndex < ActiveRecord::Migration[7.0]
  def change
    add_index(:product_categories, %i[product_id category_id], unique: true, name: 'product_category_uniq_idx')
    remove_index(:product_categories, column: :product_id, if_exists: true)
  end
end
