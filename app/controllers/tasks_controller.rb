class TasksController < ApplicationController
  before_action :move_to_login
  def index
    @user = User.find(params[:user_id])
    @task = Task.new
    @tasks = @user.tasks
  end

  def new
  end

  def create
    task = Task.create(task_params)
    render json:{ task: task }
  end



  def destroy
    task = Task.find(params[:id])
    task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:check, :content).merge(user_id: current_user.id)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end
end
