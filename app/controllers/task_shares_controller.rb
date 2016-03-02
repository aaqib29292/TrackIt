class TaskSharesController < ApplicationController
  def new
    @task = current_user.tasks.find(params[:task_id])
    @task_share = TaskShare.new
    @task_share.task = @task
  end

  def create
    user = User.find_by(email: params[:task_share][:email])
    @task_share = TaskShare.new
    @task_share.user = user
    @task_share.task_id = params[:task_share][:task_id]

    if @task_share.save
      redirect_to tasks_path
    else
      render :new
    end
  end
end
