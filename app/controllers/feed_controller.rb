get '/newsfeed/:id' do
  @user = User.where(id: params[:id]).first
  @gnaws = Gnaw.all

  #This gives us all followers of a user
  @followers_relationships = @user.follower_relationships
  # @followee_gnaws = @gnaws.where(Relationship.id)
  @followers_ids = []
  @followers_relationships.each do |relationship|
    @followers_ids << relationship.follower_id
  end

  #This gives us all people that we're following
  @followees_relationships = @user.followee_relationships
  # @followee_gnaws = @gnaws.where(Relationship.id)
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
