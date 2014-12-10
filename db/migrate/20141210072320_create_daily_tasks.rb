class CreateDailyTasks < ActiveRecord::Migration
  def change
    create_table :daily_tasks do |t|
      t.string :date
      t.integer :task_id
      t.integer :user_id
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
