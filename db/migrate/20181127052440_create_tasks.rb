class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.integer :priority, null: false, default: 1
      t.integer :progress_percent, null: false, default: 0
      t.references :user, foreign_key: true, null: false
      t.references :goal, foreign_key: true, null: false

      t.timestamps
    end
  end
end
