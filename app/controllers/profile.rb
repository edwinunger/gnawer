get '/profile/:id' do
  @user = User.where(id: params[:id]).first
  @gnaws = Gnaw.where(user_id: params[:id]).reverse
  erb :homepage
end

get '/profile/:id/delete' do
  @gnaw = Gnaw.where(id: params[:id] ).first
  @user_id = @gnaw.user_id
  @gnaw.destroy
  redirect "/profile/#{@user_id}"
end

post "/profile/:id/create" do
  @gnaw = Gnaw.create(content: params[:content], user_id: params[:id])
  @user_id = @gnaw.user_id
  # p "==============="
  # p @user_id
  # p params[:id]
  # p "==============="

  redirect "/profile/#{params[:id]}"
end


