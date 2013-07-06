get '/' do
  user = session[:user] if session[:user]
  @users = User.all
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

delete '/logout' do
  session.clear
  puts "logout"
  p session[:user]
end


#----------- SESSIONS -----------

get '/sign_in' do
  # render sign-in page
  erb :sign_in
end

post '/' do
  session[:user] = User.find_by_email(params[:email]).authenticate(params[:password])
  if session[:user]
    p session[:user]
  end
  redirect "/"
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  this_user = User.create(params[:user])
  session[:id] = this_user.id
  redirect '/'
end
