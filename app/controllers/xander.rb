get '/surveys/index' do
  erb :survey_library
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])

  erb :take_survey
end

post '/surveys/:id' do
  new_completed_survey = CompletedSurvey.create(user_id: session[:user_id], survey_id: params[:id])
  survey = Survey.find(params[:id])

  survey.questions.each do |question|

    new_answer = Answer.create(user_id: session[:user_id], choice_id: params[question.id.to_s].to_i)

  end
  redirect '/surveys/index'
end

