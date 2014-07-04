class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey
  # Remember to create a migration!
end
