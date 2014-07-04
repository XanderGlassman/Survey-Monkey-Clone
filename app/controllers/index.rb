# index
get '/' do
	session[:user_id] ||= nil
	erb :index
end

get '/onlyforfun/new' do
  session[:display] = false
  redirect '/surveys/new'
end

get '/surveys/new' do
  erb :create_survey
end

post '/surveys/new' do
  new_survey = Survey.create!(name: params[:survey_title], user_id: session[:user_id])
  session[:survey_id] = new_survey.id
  redirect '/surveys/questions/new'
end

get '/surveys/questions/new' do
  erb :create_question
end

post '/surveys/questions/new' do
  new_question = Question.create!(body: params[:question_body], survey_id: session[:survey_id])
  session[:question_id] = new_question.id
  redirect '/surveys/questions/choice/new'
end

get '/surveys/questions/choice/new' do
  erb :create_choices
end

post '/surveys/questions/choice/new' do
  new_choice = Choice.create!(body: params[:choice_body], question_id: session[:question_id])
  session[:choice_id] = new_choice.id
  session[:display] = true
  redirect '/surveys/new'
end



post '/surveys/finished' do
  session['survey_id'].clear
  session['question_id'].clear
  session['choice_id'].clear
  redirect '/users/:id/index'
end


