get '/newsfeed' do
  @user = User.where(id: rand(1..10)).first
  @gnaws = Gnaw.all

  #This gives us all followers of a user
  @followees_relationships = @user.follower_relationships
  # @followee_gnaws = @gnaws.where(Relationship.id)
  @followees_ids = []
  @followees_relationships.each do |relationship|
    @followees_ids << relationship.follower_id
  end

  #This gives us all people that we're following
  @followers_relationships = @user.followee_relationships
  # @followee_gnaws = @gnaws.where(Relationship.id)
  @followers_ids = []
  @followers_relationships.each do |relationship|
    @followers_ids << relationship.followee_id
  end




  erb :newsfeed
end
