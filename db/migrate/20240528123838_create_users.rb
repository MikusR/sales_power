class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.timestamps(null: false)
      t.string :email, null: false, default: ''
      t.text :password_digest, null: false, default: ''
    end

    add_index(:users, :email, unique: true)
  end
end
