class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.references(:product, foreign_key: true, null: false)
      t.references(:category, foreign_key: true, null: false)
    end
  end
end
