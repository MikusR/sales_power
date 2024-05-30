class AddProductUniquenessIndices < ActiveRecord::Migration[7.0]
  def change
    remove_index(:products, column: :name, if_exists: true)
    remove_index(:products, column: :sku, if_exists: true)

    add_index(:products, :name, unique: true)
    add_index(:products, :sku, unique: true)
  end
end
