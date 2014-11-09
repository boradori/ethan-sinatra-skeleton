get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :index
end

get '/users/new' do
  erb :signup
end

post '/users' do
  user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
  if user.nil?
    #incorrect credentials
    erb :signup
  else
    session[:user_id] = user.id
    redirect '/'
  end
end

post '/sessions' do
  user = User.find_by(:email => params[:email])
  if user.nil?
    #incorrect email
    erb :index
  elsif user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    #incorrect password
    erb :index
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

