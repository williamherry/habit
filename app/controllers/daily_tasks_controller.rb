class DailyTasksController < ApplicationController
  def complete
    DailyTask.find(params[:daily_task_id]).update(completed: true)
    render json: { success: true }
  end

  def uncomplete
    DailyTask.find(params[:daily_task_id]).update(completed: false)
    render json: { success: true }
  end
end
