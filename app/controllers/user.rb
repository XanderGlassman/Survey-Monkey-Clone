# get====================================

get '/users/new' do
  erb :sign_up
end

get '/users/:id/index' do
	@users = 
  erb :user_home
end

# post===================================

post '/users/delete' do
	@user = Users
end