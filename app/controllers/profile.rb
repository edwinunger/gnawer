get '/profile/:id' do
  @user = User.where(id: params[:id]).first
  @gnaws = Gnaw.where(user_id: params[:id])
  erb :homepage
end
