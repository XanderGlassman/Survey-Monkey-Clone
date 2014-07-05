# get '/onlyforfun/new' do
#   session[:display] = false
#   redirect '/surveys/new'
# end

get '/surveys/new' do
  erb :create_survey
end

# get '/surveys/questions/new' do
#   erb :create_question
# end

# get '/surveys/questions/choice/new' do
#   erb :create_choices
# end

get '/surveys/:id/stats' do
  erb :stats
end

get '/surveys/index' do
  erb :survey_library
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])

  erb :take_survey
end



# post '/surveys/questions/new' do
#   new_question = Question.create!(body: params[:question_body], survey_id: session[:survey_id])
#   session[:question_id] = new_question.id
#   redirect '/surveys/questions/choice/new'
# end

# post '/surveys/questions/choice/new' do
#   new_choice = Choice.create!(body: params[:choice_body], question_id: session[:question_id])
#   session[:choice_id] = new_choice.id
#   session[:display] = true
#   redirect '/surveys/new'
# end

# post '/surveys/new' do
#   new_survey = Survey.create!(name: params[:survey_title], user_id: session[:user_id])
#   session[:survey_id] = new_survey.id
#   redirect '/surveys/questions/new'
# end

# post '/surveys/finished' do
#   session['survey_id'].clear
#   session['question_id'].clear
#   session['choice_id'].clear
#   redirect '/users/:id/index'
# end

post '/surveys/delete' do
	@survey = Survey.find(params[:id])
	@survey.destroy
	# This will be json!!!!!!!!!!!!!!!!
	redirect "/users/#{session[:user_id]}/index"
end

post "/surveys/create" do
  puts (params[:choice_body])
  @choice = Choice.create(:body => params[:choice_body], :question_id => 1)

  content_type "application/json"
  {choice_body: @choice.body }.to_json
end

post "/surveys/create_title" do
  @survey = Survey.create(name: params[:name])
  @question = Question.create(body: params[:body], survey_id: @survey.id)

  content_type "application/json"
  {question_body: @question.body, question_id: @question.id, survey: @survey.name}.to_json
end

post '/surveys/:id' do
  new_completed_survey = CompletedSurvey.create(user_id: session[:user_id], survey_id: params[:id])
  survey = Survey.find(params[:id])

  survey.questions.each do |question|

    new_answer = Answer.create(user_id: session[:user_id], choice_id: params[question.id.to_s].to_i)

  end
  redirect '/surveys/index'
end

