FactoryGirl.define do
  factory :customer do
    password { Faker::Internet.password }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
