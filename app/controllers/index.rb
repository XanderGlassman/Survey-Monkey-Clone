# index
get '/' do
	session[:user_id] ||= nil
	erb :index
end




