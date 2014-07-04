class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  has_many :takers, through: :answers, source: :user
  # Remember to create a migration!
end
