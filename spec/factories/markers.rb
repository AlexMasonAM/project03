FactoryGirl.define do
  factory :marker do
    latitude Faker::Name.first_name
    longitude Faker::Name.last_name
    address Faker::Address.street_address
    end_time DateTime.now
  end

end
