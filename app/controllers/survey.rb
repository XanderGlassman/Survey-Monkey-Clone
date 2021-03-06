# get====================================


get '/surveys/new' do
  erb :create_survey
end

get '/surveys/:id/stats' do
  @survey = Survey.find(params[:id])
  @total_answers_per_question = @survey

  erb :new_stats

end

get '/surveys/index' do
  erb :survey_library
end

get '/surveys/:id/edit' do
  @user = User.find(session[:user_id])
  @survey = Survey.find(params[:id])
  erb :edit
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  erb :take_survey
end

# post===================================

# get '/surveys/:id/stats' do
#   @survey = Survey.find(session[:survey_id])
#   session[:survey_id] = nil

#   hash = {}

#   @survey.questions.each_with_index do |question, index|
#     object = "#{question}#{index}": "question.name"
#     hash.merge!(object)
#   end

#   puts "00-------------------------------------------------------00"
#   puts hash
#   erb :stats

#   # content_type "application/json"
#   # {survey_name: @survey.name}.to_json
# end

post '/surveys/delete' do
	@survey = Survey.find(params[:id])
  puts "__________________________"
  puts params[:id]
  puts "___________________________"
	@survey.destroy
  content_type "application/json"
  {id: @survey.id}.to_json
end

post "/surveys/create" do
  @choice = Choice.create(:body => params[:choice_body], :question_id => params[:question_id].to_i)

  content_type "application/json"
  {choice_body: @choice.body }.to_json
end

post "/surveys/create_title" do
  @survey = Survey.create(name: params[:name], user_id: session[:user_id])

  content_type "application/json"
  {survey: @survey.name, survey_id: @survey.id}.to_json
end

post "/surveys/create_question" do
  @question = Question.create(body: params[:body], survey_id: params[:survey_id])

  content_type "application/json"
  {question_body: @question.body, question_id: @question.id}.to_json
end

post '/surveys/:id' do
  new_completed_survey = CompletedSurvey.create(user_id: session[:user_id], survey_id: params[:id])
  survey = Survey.find(params[:id])

  survey.questions.each do |question|

    new_answer = Answer.create(user_id: session[:user_id], choice_id: params[question.id.to_s].to_i)
  end
  redirect '/surveys/index'
end

post '/surveys/:id/update' do
  survey = Survey.find(params[:id])
    survey.update_attributes(params[:survey])

    survey.questions.each do |question|
      question.update(body: params[question.id.to_s])
        question.choices.each do |choice|
          choice.update(params["choice#{choice.id}"])
        end
    end
  redirect "/users/#{session[:user_id]}/index"
end




