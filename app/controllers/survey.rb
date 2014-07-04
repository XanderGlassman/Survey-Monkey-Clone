# get '/surveys/new' do
#   erb :create_survey
# end

# get '/surveys/index' do
#   erb :survey_library
# end

# get '/surveys/:id/stats' do
#   erb :stats
# end

# get '/surveys/:id' do
#   "Hello World"
#   erb :take_survey
# end

post '/surveys/delete' do
	@survey = Survey.find(params[:id])
	@survey.destroy
	# This will be json!!!!!!!!!!!!!!!!
	redirect "/users/#{session[:user_id]}/index"
end