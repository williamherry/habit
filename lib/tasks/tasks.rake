task generate_daily_tasks: :environment do
  User.find_each do |user|
    user.tasks.each do |task|
      DailyTask.where(user_id: user.id, task_id: task.id, date: Time.now.to_date.to_s).first_or_create
    end
  end
end
