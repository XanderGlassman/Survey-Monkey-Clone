# get==========================================

get '/' do
	erb :index
end

get '/users/new' do
	erb :sign_up
end

get '/users/:id/index' do
	erb :user_home
end

get '/surveys/new' do
	erb :page_create
end

get 'surveys/:id/stats'
	erb :stats
end

get '/surveys/index' do
	erb :survey_library
end

get 'surveys/:id' do 
	erb :take_survey
end

# post=========================================