get '/newsfeed' do
  @gnaws = Gnaw.all

  @user_gnaws = @gnaws.where()
end
