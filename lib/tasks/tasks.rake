task generate_daily_tasks: :environment do
  User.find_each do |user|
    user.tasks.each do |task|
      days = (Date.today..(Date.today + 1000))
      days.each do |day|
        DailyTask.where(user_id: user.id, task_id: task.id, date: day.to_s).first_or_create
      end
    end
  end
end
