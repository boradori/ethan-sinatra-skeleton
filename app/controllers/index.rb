get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  u = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
  session[:user_id] = u.id
  redirect '/'
end

post '/login' do
  if User.find_by(:email => params[:email], :password => params[:password])
    @user = User.find_by(:email => params[:email], :password => params[:password])
    session[:user_id] = @user.id
  end
  redirect '/'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

