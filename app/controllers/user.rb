get '/users/new' do
  erb :sign_up
end

get '/users/:id/index' do
  erb :user_home
end
