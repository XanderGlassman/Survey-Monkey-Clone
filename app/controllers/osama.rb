post '/survey/new' do
	new_survey = Survey.create!(name: params[:survey_title], user_id: session[:user_id])
	session[:survey_id] = new_survey.id
	redirect_to '/surveys/new'
end

get '/surveys/new' do
  erb :create_survey
end

post '/surveys/questions/new' do
	new_question = Question.create!(body: params[:qustion_body], survey_id: session[:survey_id])
	session[:question_id] = new_question.id
	redirect_to '/surveys/questions/new'
end

get '/surveys/questions/new' do
	erb :create_survey
end

post '/surveys/questions/choice/new' do
	new_choice = Choice.create!(body: params[:choice_body], question_id: session[:question_id])
	session[:choice_id] = new_choice.id
	redirect_to '/surveys/questions/choice/new'
end

get '/surveys/questions/choice/new' do
	erb :create_survey
end

post '/survey/finished' do
	session['survey_id'].clear
	session['question_id'].clear
	session['choice_id'].clear
	redirect_to '/users/:id/index'
end





