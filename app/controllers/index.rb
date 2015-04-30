get '/' do
  @id = session[:user_id]
  @user = User.where(id: @id)
  puts "went to home page"
  erb :index

end

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.where(email: params[:email]).first
  if @user.password_digest = params[:password]
    status 200
    session[:user_id] = @user.id
    redirect '/' # redirect to profile page once complete
  else
    "no user FUCK YOU"
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end
