class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :taker, class_name: "User"
  # Remember to create a migration!
end
