get '/surveys/new' do
  erb :create_survey
end

get '/surveys/:id/stats' do
  erb :stats
end

get '/surveys/index' do
  erb :survey_library
end

get '/surveys/:id/edit' do
  @survey = Survey.find(params[:id])

  erb :edit
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])

  erb :take_survey
end

post '/surveys/delete' do
	@survey = Survey.find(params[:id])
	@survey.destroy
	# This will be json!!!!!!!!!!!!!!!!
	redirect "/users/#{session[:user_id]}/index"
end

post "/surveys/create" do
  @choice = Choice.create(:body => params[:choice_body], :question_id => params[:question_id].to_i)

  content_type "application/json"
  {choice_body: @choice.body }.to_json
end

post "/surveys/create_title" do
  @survey = Survey.create(name: params[:name], user_id: session[:user_id])
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

