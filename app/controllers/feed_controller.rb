get '/newsfeed/:id' do
  @user = User.where(id: params[:id]).first
  @gnaws = Gnaw.all

  #This gives us all followers of a user
  @followers_relationships = @user.follower_relationships
  @followers_ids = []
  @followers_relationships.each do |relationship|
    @followers_ids << relationship.follower_id
  end

  #This gives us all people that we're following
  @followees_relationships = @user.followee_relationships
  @followees_ids = []
  @followees_relationships.each do |relationship|
    @followees_ids << relationship.followee_id
  end

  @followee_tweets = []

  @followees_ids.each do |link_id|
    @followee_tweets << @gnaws.where(user_id: link_id)
  end

  @followee_tweets.flatten!

  erb :newsfeed
end

post '/profile/:id/gnaw' do
  @user = User.where(id: params[:id]).first
  @id = session[:user_id]
  @exists = Relationship.where(
    followee_id: @user.id,
    follower_id: @id
    ).first
  @relationship = Relationship.new(
    followee_id: @user.id,
    follower_id: @id
    )
  if @exists.nil?
    if @relationship.save
      redirect "/profile/#{@id}"
    else
      status 404
      return "You fucked up for some reason."
    end
  else
    status 404
    return "You fucked up. You're already gnawing this user."
  end
end

delete '/profile/:id/ungnaw' do
  @user = User.where(id: params[:id]).first
  @id = session[:user_id]
  @relationship = Relationship.where(
    followee_id: @user.id,
    follower_id: @id
    ).first
  if @relationship.nil?
    status 404
    return "You fucked up. You're not currently gnawing this user. "
  else
    @relationship.destroy
    redirect "/profile/#{@id}"
  end
end
