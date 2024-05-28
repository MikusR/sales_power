class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.timestamps(null: false)
      t.string(:name, null: false, default: '', limit: 50)
      t.text(:description, null: false, default: '')
      t.boolean(:visible, null: false, default: false)
    end

    add_index(:categories, :name)
    add_index(:categories, :visible)
  end
end
