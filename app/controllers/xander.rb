get '/surveys/index' do
  erb :survey_library
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])

  erb :take_survey
end

post '/surveys/:id' do
  puts "IS PARAMS WORKING? ---------------------------------------"
  puts params[:question]
  survey = Survey.find(params[:id])
  survey.questions.each do |question|
    question.id
  end



end
