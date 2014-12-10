class HomeController < ApplicationController
  def index
    @tasks = current_user.daily_tasks.where(date: Time.now.to_date.to_s)
  end
end
