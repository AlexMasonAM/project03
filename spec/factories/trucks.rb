FactoryGirl.define do
  factory :truck do
    name Faker::App.name
    genre "american"
    twitter_handle "@trucktruck"
    yelp_id Faker::Bitcoin.address
    yelp_ratings "5 stars"
    tweet_most_recent "@ the place"
  end
end
