FactoryGirl.define do
  factory :marker do
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    address { Faker::Address.street_address }
    end_time { Faker::Time.forward(23, :morning)}
  end

end
