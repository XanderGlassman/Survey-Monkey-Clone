User.create!(name: "xander", username: "xander1991", password: 123456, email: "xander@gmail.com") # id: 1

User.create!(name: "colin", username: "colintrent", password: 123456, email: "colin@gmail.com") #id: 2

# ----------------- Survey 1 and All of Its Pieces-----------------------------------

Survey.create!(name: "Survey 1", user_id: 1) #id: 1

Question.create!(body: "Question 1", survey_id: 1) #id: 1
Question.create!(body: "Question 2", survey_id: 1) #id: 2

Choice.create!(body: "Choice 1", question_id: 1) #id: 1
Choice.create!(body: "Choice 2", question_id: 1) #id: 2

Choice.create!(body: "Choice 1", question_id: 2) #id: 3
Choice.create!(body: "Choice 2", question_id: 2) #id: 4


# ---------------- Survey 2 and All of Its Pieces ------------------------------------

Survey.create!(name: "Survey 2", user_id: 2) #id: 2

Question.create!(body: "Question 1", survey_id: 2) #id: 3
Question.create!(body: "Question 2", survey_id: 2) #id: 4

Choice.create!(body: "Choice 1", question_id: 3) #id: 5
Choice.create!(body: "Choice 2", question_id: 3) #id:6

Choice.create!(body: "Choice 1", question_id: 4) #id: 7
Choice.create!(body: "Choice 2", question_id: 4) #id: 8

# ---------------- User 1 is Completing Survey 1 ------------------------------------

CompletedSurvey.create!(survey_id: 1, user_id: 1 )

Answer.create!(user_id: 1, choice_id: 1)
Answer.create!(user_id: 1, choice_id: 4)

# ---------------- User 1 is Completing Survey 2 ------------------------------------

CompletedSurvey.create!(survey_id: 2, user_id: 1 )

Answer.create!(user_id: 1, choice_id: 5)
Answer.create!(user_id: 1, choice_id: 7)


