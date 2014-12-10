class DailyTask < ActiveRecord::Base
  validates :user_id, presence: true
  validates :task_id, presence: true
  validates :date, presence: true

  belongs_to :user
  belongs_to :task
end
