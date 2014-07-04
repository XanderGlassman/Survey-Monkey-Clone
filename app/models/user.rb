require "bcrypt"

class User < ActiveRecord::Base
  has_many :surveys
  has_many :answers
  has_many :completed_surveys
  has_many :taken_surveys, through: :completed_surveys, source: :survey
  has_many :choices, through: :answers

  include BCrypt
  # Remember to create a migration!
  def self.authenticate(email, password)

  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  # Remember to create a migration!
end
