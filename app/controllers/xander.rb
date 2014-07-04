get '/surveys/index' do
  erb :survey_library
end

get '/surveys/:id' do
  "Hello World"
  erb :take_survey
end
