class TaskShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  attr_accessor :email
  # As TaskShare doesn't hav email in db , it is used to defines new method email, but never save it into db for NoMethodError

  validates :task_id, presence: true, uniqueness: { scope: :user_id,
    message: "Task already shared wit user" }
  validates :user_id, presence: true
end
