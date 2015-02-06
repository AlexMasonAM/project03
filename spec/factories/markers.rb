FactoryGirl.define do
  factory :marker do
    address Faker::Address.street_address
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    end_time Faker::Time.forward(2, :evening)
    truck_id Faker::Number.number(4)  
  end

end
