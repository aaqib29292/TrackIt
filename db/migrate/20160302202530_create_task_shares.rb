class CreateTaskShares < ActiveRecord::Migration
  def change
    create_table :task_shares do |t|
      t.references :user, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
