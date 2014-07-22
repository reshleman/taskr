class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if current_user.tasks << @task
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
