get '/profile/:id' do
  @user = User.where(id: params[:id]).first
  @gnaws = Gnaw.where(user_id: params[:id]).first
  erb :homepage
end
