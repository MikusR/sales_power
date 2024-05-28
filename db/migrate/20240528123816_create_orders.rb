class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.timestamps(null: false)
      t.references(:customer, foreign_key: true, null: false)
      t.integer(:status, null: false, default: 0) # enum
      t.decimal(:total, null: false, precision: 10, scale: 2)
    end

    add_index(:orders, :status)
  end
end
