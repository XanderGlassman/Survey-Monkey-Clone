class User < ActiveRecord::Base
  has_many :surveys
  has_many :answers
  has_many :completed_surveys
  has_many :taken_surveys, through: :completed_surveys, source: :survey
  has_many :choices, through: :answers
  # Remember to create a migration!
end
