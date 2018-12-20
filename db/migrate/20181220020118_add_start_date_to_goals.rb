class AddStartDateToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :start_date, :date, null: false, default: Time.now
    add_column :goals, :end_date, :date, null: false, default: Time.now
    add_column :tasks, :start_date, :date, null: false, default: Time.now
    add_column :tasks, :end_date, :date, null: false, default: Time.now
  end
end
