get '/' do
  @id = session[:user_id]
  @user = User.where(id: @id).first
  puts "went to home page"
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.new(
    first_name: params[:name],
    email: params[:email],
    password: params[:password],
    )
  if @user.save
    session[:user_id] = @user.id
    redirect "/profile/#{@user.id}" # redirect to profile page once complete
  else
    status 406
    "Invalid Sign Up Combination"
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.where(email: params[:email]).first
  if @user.password = params[:password]
    status 200
    session[:user_id] = @user.id
    redirect "/profile/#{@user.id}" # redirect to profile page once complete
  else
    "no user FUCK YOU"
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect '/'
end
