class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.timestamps(null: false)
      t.references(:user, foreign_key: true, null: false)
      t.string(:first_name, null: false, limit: 50, default: '')
      t.string(:last_name, null: false, limit: 50, default: '')
      t.string(:region, null: false, limit: 50, default: '')
    end
  end
end
