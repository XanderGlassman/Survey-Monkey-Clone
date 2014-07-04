class Survey < ActiveRecord::Base
  has_many :questions
  has_many :completed_surveys
  belongs_to :user

  # Remember to create a migration!
end
