class CreateProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :producers do |t|
      t.timestamps(null: false)
      t.string(:name, null: false, default: '')
      t.text(:description, null: false, default: '')
      t.integer(:founding_year, null: false, default: 1965)
    end
    add_index(:name, unique: true)
  end
end
