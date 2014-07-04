get '/surveys/new' do
  erb :page_create
end

get '/surveys/index' do
  erb :survey_library
end

get '/surveys/:id/stats' do
  erb :stats
end

get '/surveys/:id' do
  "Hello World"
  erb :take_survey
end

