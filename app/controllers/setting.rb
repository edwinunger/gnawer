get '/setting/:id' do 
	@user = User.where(id: params[:id]).first
	erb :setting
end

post '/setting/:id/update' do 
	@user = User.where(id: params[:id]).first
	if params[:name]
		@user.first_name = params[:name]
		@user.save
		redirect '/'
	elsif params[:email]
		@user.email = params[:email]
		@user.save
		redirect '/'
	elsif params[:username]
		@user.user_name = params[:username]
		@user.save
		redirect '/'
	elsif params[:password]
		@user.password_digest = params[:password]
		@user.save
		redirect '/'
	end
end