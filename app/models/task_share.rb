class TaskShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

  attr_accessor :email
  # As TaskShare doesn't hav email in db , it is used to defines new method email, but never save it into db for NoMethodError
end
