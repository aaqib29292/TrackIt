class TaskSharesController < ApplicationController
  before_action :fetch_new_task_share

  def new
    @task_share.task = @task
  end

  def create
    @task_share.user = User.find_by(email: params[:task_share][:email])

    if @task_share.save
      redirect_to tasks_path
    else
      @task_share.email = params[:task_share][:email]
      flash.now[:danger] = @task_share.errors.full_messages.join(". ")
      render :new
    end
  end

private
  def fetch_new_task_share
    @task = current_user.tasks.find(params[:task_id])
    @task_share = @task.task_shares.new
  end

end
