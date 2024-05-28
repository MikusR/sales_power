class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    # Name: Name of the product.
    # Description: A brief description of the product.
    # Price: The price of the product in USD
    # Stock Quantity: The quantity of the product available in stock.
    # SKU (Stock Keeping Unit): A unique identifier for the product, useful for inventory management.
    # Weight: The weight of the product in grams, useful for shipping calculations.
    # Rating: Average rating of the product based on customer reviews.
    # Listed: Whether the product is shown to customers

    create_table :products do |t|
      t.string(:name, null: false, default: '')
      t.text(:description, null: false, default: '')
      t.decimal(:price, null: false, precision: 10, scale: 2)
      t.bigint(:stock_quantity, null: false, default: 0)
      t.string(:sku, null: false)
      t.bigint(:weight, null: false)
      t.decimal(:rating, null: false, precision: 2, scale: 1)
      t.boolean(:listed, null: false, default: false)
      t.timestamps(null: false)
    end

    add_index(:products, :name) # if LIKE queries will be used, trigram index ftw
    add_index(:products, :price)
    add_index(:products, :stock_quantity)
    add_index(:products, :sku)
    add_index(:products, :weight)
    add_index(:products, :rating)
    add_index(:products, :listed)
  end
end
