enable :sessions

# get====================================

get '/users/new' do

  erb :sign_up
end

get '/users/:id/index' do
	@user = User.find(session[:user_id])
  erb :user_home
end

# post===================================

post '/users/logout' do
	session.clear
	redirect '/'
end

post '/users/login' do
	session[:user_id] = params[:user_id]
	@user = User.find_by(username: params[:username])
	session[:user_id] = @user.id
  if @user.password == params[:password] && session["user"] == params[:user_name]
    redirect "/users/#{@user.id}/index"
  else
  	raise "You must enter a valid username and password!"
    redirect '/'
  end
end

post '/users/new' do
	@user = User.create(:name => params[:name], :username => params[:username], :email => params[:email], :password => params[:password])
	session[:user_id] = @user.id
	redirect "/users/#{@user.id}/index"
end


