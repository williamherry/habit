class User < ActiveRecord::Base
  attr_accessor :password

  before_save :encrypt_password

  validates :username, uniqueness: true
  validates_confirmation_of :password

  def self.authenticate(username, password)
    user = User.where(username: username).first

    password_hash = BCrypt::Engine.hash_secret(password, user.password_salt)
    (user && user.password_hash == password_hash) ? user : nil
  end

  private

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
