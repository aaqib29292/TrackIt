# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ActiveRecord::Base
  module Status
    NOT_STARTED = 0
    IN_PROGRESS = 1
    FINISHED = 2
  end

  def not_started?
    self.status == Status::NOT_STARTED
  end

  def in_progress?
    self.status == Status::IN_PROGRESS
  end

  def finished?
    self.status == Status::FINISHED
  end

end
