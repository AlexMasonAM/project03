# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create 10 truck accounts
10.times do
  password = Faker::Internet.password
  TruckAccount.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company: Faker::Company.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
  )
end

# create some trucks and assign them to random truck accounts
accts = TruckAccount.all
genres = ['Burgers', 'Mexican', 'American', 'Seafood', 'Barbeque', 'Korean', 'Fusion', 'Vegan']
25.times do
  name = Faker::App.name
  truck = Truck.create(
    name: name,
    genre: genres.sample,
    twitter_handle: "@#{name}",
    yelp_id: Faker::Lorem.characters(16),
    yelp_ratings: rand(1..5),
    tweet_most_recent: Faker::Lorem.sentence,
    truck_account_id: accts.sample.id
  )

end

# create a marker for each truck
trucks = Truck.all
trucks.count.times do |i|
  Marker.create(
    latitude: rand(33.8..34.2), 
    longitude: rand(-118.4..-118.0), 
    address: Faker::Address.street_address, 
    end_time: Time.now + rand(2..8).hours,
    truck_id: trucks[i].id
  )
end

# create some users
50.times do
  password = Faker::Internet.password
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    yelp_id: Faker::Lorem.characters(16),
    password: password,
    password_confirmation: password
    )
end

users = User.all
# create favorite links between users and trucks
200.times do
  Favorite.create(
    truck_id: trucks.sample.id,
    user_id: users.sample.id
  )
end


