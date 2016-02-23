class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :status, default: Task::Status::NOT_STARTED

      t.timestamps null: false
    end
  end
end
