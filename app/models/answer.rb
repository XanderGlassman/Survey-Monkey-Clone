class Answer < ActiveRecord::Base
  belongs_to :choice
  belongs_to :taker, class_name: "User", foreign_key: "user_id"
  # Remember to create a migration!
end
