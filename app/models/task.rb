class Task < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  has_many :daily_tasks
end
