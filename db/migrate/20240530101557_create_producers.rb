class CreateProducers < ActiveRecord::Migration[7.0]
  def change
    create_table :producers do |t|

      t.timestamps
    end
  end
end
