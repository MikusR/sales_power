class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.timestamps(null: false)
      t.references(:manager, foreign_key: true, null: false)
      t.references(:topic, polymorphic: true, foreign_key: false, index: false, null: false)
      t.text(:content, null: false, default: '')
    end

    add_index(:comments, %i[topic_type topic_id], name: :idx_comment_topic)
  end
end
