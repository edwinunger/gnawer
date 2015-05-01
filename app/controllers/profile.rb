get '/profile/:id' do
  @user = User.where(id: params[:id]).first
  @gnaws = Gnaw.where(user_id: params[:id]).reverse
  @session_id = session[:user_id]
  @session_user = User.where(id: @session_id).first

  #This gives us all followers of a user
  @followers_relationships = @user.follower_relationships
  # @followee_gnaws = @gnaws.where(Relationship.id)
  @followers_ids = []
  @followers_relationships.each do |relationship|
    @followers_ids << relationship.follower_id
  end

  @follower_users = []
  @followers_ids.each do |follower_id|
    @follower_users << User.where(id: follower_id).first
  end

  #This gives us all people that we're following
  @followees_relationships = @user.followee_relationships
  # @followee_gnaws = @gnaws.where(Relationship.id)
  @followees_ids = []
  @followees_relationships.each do |relationship|
    @followees_ids << relationship.followee_id
  end

  @followee_users = []
  @followees_ids.each do |followee_id|
    @followee_users << User.where(id: followee_id).first
  end

  erb :homepage

end

put '/photo/:id' do
  @user = User.where(id: params[:id]).first
  @user.avatar_url = params[:url]
  @user.save
  redirect "/profile/#{@user.id}"
end

get '/all_users' do
  @users = User.all
  erb :all_users
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


  redirect "/profile/#{params[:id]}"
end


