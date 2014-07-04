enable :sessions


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

get '/users/new' do

  erb :sign_up
end

post '/users/new' do
	@user = User.create(:name => params[:name], :username => params[:username], :email => params[:email], :password => params[:password])
	session[:user_id] = @user.id
	redirect "/users/#{@user.id}/index"
end

get '/users/:id/index' do
  erb :user_home
end
