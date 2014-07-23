class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    current_user.tasks << task

    render task
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

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { render json: task }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
