# create 10 truck accounts
10.times do
  TruckAccount.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    company: Faker::Company.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# save them in accts variable for later use
accts = TruckAccount.all


# create 25 trucks (with real truck info) and assign them to random truck accounts
trucks = [
  { name: 'The Grilled Cheese Truck', yelp_id: 'the-grilled-cheese-truck-los-angeles', genre: 'American', twitter: 'grlldcheesetruk', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Kogi BBQ', yelp_id: 'kogi-bbq-los-angeles', genre: 'Korean', twitter: 'kogibbq', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Coolhaus', yelp_id: 'coolhaus-ice-cream-truck-culver-city-2', genre: 'Dessert', twitter: 'CoolhausLA', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Komodo', yelp_id: 'komodo-truck-los-angeles-3', genre: 'Asian Fusion', twitter: 'komodotruck', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Lobsta Truck', yelp_id: 'lobsta-truck-los-angeles', genre: 'Seafood', twitter: 'LobstaTruck', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Sprinkles Mobile', yelp_id: 'sprinklesmobile-beverly-hills', genre: 'Dessert', twitter: 'sprinklesmobile', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'South Philly Experience', yelp_id: 'south-philly-experience-venice-2', genre: 'American', twitter: 'southphillyexp', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Jogasaki Sushi Burrito', yelp_id: 'jogasaki-truck-los-angeles', genre: 'Asian Fusion', twitter: 'JogasakiBurrito', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Baby\'s Badass Burgers', yelp_id: 'babys-badass-burgers-los-angeles', genre: 'Burgers', twitter: 'BabysBBs', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'India Jones Chow Truck', yelp_id: 'india-jones-chow-truck-santa-monica', genre: 'Indian', twitter: 'indiajonesCT', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'The Middle Feast', yelp_id: 'the-middle-feast-food-truck-los-angeles', genre: 'Middle Eastern', twitter: 'MidFeastTruck', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Get Shaved', yelp_id: 'get-shaved-truck-northridge', genre: 'Dessert', twitter: 'getshaved', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Mexi Calbi', yelp_id: 'mexi-calbi-anaheim', genre: 'Asian Fusion', twitter: 'MexiCalbi', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Don Chow Tacos', yelp_id: 'don-chow-tacos-los-angeles', genre: 'Asian Fusion', twitter: 'donchowtacos', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'White Rabbit Truck', yelp_id: 'white-rabbit-truck-los-angeles-2', genre: 'Asian Fusion', twitter: 'WhiteRabbitTruk', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Dogtown Dogs', yelp_id: 'dogtown-dogs-santa-monica', genre: 'Hot Dogs', twitter: 'dogtowndog', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Crepe\'n Around', yelp_id: 'crepen-around-northridge', genre: 'Dessert', twitter: 'CrepenAround', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Hungry Nomad', yelp_id: 'hungry-nomad-truck-hollywood', genre: 'Armenian', twitter: 'nomadtruck', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'El Chato Taco Truck', yelp_id: 'el-chato-taco-truck-los-angeles-2', genre: 'Mexican', twitter: 'ChatoTacoTruck', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'The Lobos Truck', yelp_id: 'the-lobos-truck-los-angeles', genre: 'American', twitter: 'TheLobosTruck', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Tokyo Doggie Style', yelp_id: 'tokyo-doggie-style-los-angeles-2', genre: 'Asian Fusion', twitter: 'TokyoDoggieStyl', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'The Bun Truck', yelp_id: 'the-bun-truck-los-angeles', genre: 'Asian Fusion', twitter: 'thebuntruck', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Amazebowls', yelp_id: 'amazebowls-los-angeles-2', genre: 'Vegan', twitter: 'Amazebowls', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Mandoline Grill', yelp_id: 'mandoline-grill-los-angeles', genre: 'Vietnamese', twitter: 'MandolineGrill', tweet_most_recent: Faker::Lorem.sentence },
  { name: 'Burnt to a Crisp', yelp_id: 'burnt-to-a-crisp-truck-los-angeles', genre: 'American', twitter: 'burnttoacrisptx', tweet_most_recent: Faker::Lorem.sentence }
]
trucks.each do |truck|
  Truck.create(
    name: truck[:name],
    genre: truck[:genre],
    twitter_handle: truck[:twitter],
    yelp_id: truck[:yelp_id],
    tweet_most_recent: truck[:tweet_most_recent],
    truck_account_id: accts.sample.id
  )
end

# save all trucks for later use
trucks = Truck.all


# create a marker for each truck
trucks.count.times do |i|
  Marker.create(
    latitude: rand(33.8..34.2), 
    longitude: rand(-118.4..-118.0), 
    end_time: Time.now + rand(2..8).hours,
    truck_id: trucks[i]['id']
  )
end

# create some users
50.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    yelp_id: Faker::Lorem.characters(16),
    password: 'password',
    password_confirmation: 'password'
    )
end

# save all users for later use
users = User.all

# create 100 favorite links between users and trucks
100.times do
  Favorite.create(
    truck_id: trucks.sample['id'],
    user_id: users.sample['id']
  )
end


