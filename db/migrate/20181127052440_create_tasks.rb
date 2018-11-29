class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.integer :priority, null: false, default: 1
      t.integer :progress_percent, null: false, default: 0
      t.references :user, foreign_key: true
      t.references :goal, foreign_key: true

      t.timestamps
    end
  end
end
