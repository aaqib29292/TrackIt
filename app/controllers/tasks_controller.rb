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
  before_action :authenticate_user!

  def index
    # all user hav same
    # @not_started_tasks = Task.where(status: Task::Status::NOT_STARTED)

    # individual user tasks
    @not_started_tasks = current_user.tasks.where(status: Task::Status::NOT_STARTED)
    @in_progress_tasks = current_user.tasks.where(status: Task::Status::IN_PROGRESS)
    @finished_tasks = current_user.tasks.where(status: Task::Status::FINISHED)

    # Task::Status::NOT_STARTED takes NOT_STARTED value from Status module from task.rb

    # Task stands for all de tasks whereas current_user.tasks stands for only individual user tasks
  end

  def new
    # @task = Task.new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update_attribute(:status, params[:status].to_i)
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
