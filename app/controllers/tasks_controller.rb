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

class TasksController < ApplicationController
  def index
    @not_started_tasks = Task.where(status: Task::Status::NOT_STARTED)
    @in_progress_tasks = Task.where(status: Task::Status::IN_PROGRESS)
    @finished_tasks = Task.where(status: Task::Status::FINISHED)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attribute(:status, params[:status].to_i)
    redirect_to tasks_path
  end
end
