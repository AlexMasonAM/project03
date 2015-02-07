FactoryGirl.define do
  factory :truck_account do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    company Faker::Company.name
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
  end  
end
