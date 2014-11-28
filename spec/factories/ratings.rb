FactoryGirl.define do
  factory :rating do
    customer { FactoryGirl.create(:customer) }
    book { FactoryGirl.create(:book) }
    text { Faker::Lorem.paragraph }
    rating { rand(1..10) }
  end
end
