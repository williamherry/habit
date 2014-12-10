class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Create task success"
      redirect_to "/tasks"
    else
      flash[:alert] = "There was a problem creating task, Please try again"
      redirect_to :back
    end
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
