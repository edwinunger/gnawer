require 'faker'

10.times do
  user_info = {
    user_name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    first_name: Faker::Name.name
  }
  User.new(user_info).save
  puts "seeding users..."
end

50.times do
  tweet_info = {
    content: Faker::Lorem.sentence,
    user_id: rand(1..10)
  }
  Gnaw.new(tweet_info).save
  puts "seeding gnaws..."
end

counter = 2
9.times do
  Relationship.create(follower_id: counter, followee_id: 1)
  counter +=1
end

other_counter = 2
8.times do
  Relationship.create(follower_id: 10, followee_id: other_counter)
  other_counter +=1
end
