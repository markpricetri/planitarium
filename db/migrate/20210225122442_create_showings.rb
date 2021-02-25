class CreateShowings < ActiveRecord::Migration[6.0]
  def change
    create_table :showings do |t|
      t.datetime :start_time
      t.integer :capacity
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
