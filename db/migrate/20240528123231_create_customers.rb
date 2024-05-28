class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.timestamps(null: false)
      t.references(:user, foreign_key: true, null: false)
      t.string(:first_name, null: false, limit: 50, default: '')
      t.string(:last_name, null: false, limit: 50, default: '')
      t.integer(:default_checkout_method, null: false, default: 0)
    end

    add_index(:customers, :default_checkout_method)
  end
end
