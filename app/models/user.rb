class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates :username, uniqueness: true
  validates :username, presence: true
  validates_confirmation_of :password

  has_many :tasks
  has_many :daily_tasks

  def self.authenticate(username, password)
    user = User.where(username: username).first
    return nil unless user

    password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
    user.password_hash == password_hash ? user : nil
  end

  def daily_score(date = Date.today.to_s)
    return 0 if daily_tasks.where(date: date).empty?

    completed_daily_tasks = daily_tasks.where(date: date, completed: true)
    all_daily_tasks = daily_tasks.where(date: date)
    (completed_daily_tasks.count / all_daily_tasks.count.to_f * 100).to_i
  end

  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
