class CompletedSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  # Remember to create a migration!
end
