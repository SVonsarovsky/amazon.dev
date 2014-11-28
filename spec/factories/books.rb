FactoryGirl.define do
  factory :book do
    title { Faker::Lorem.sentence(3) }
    price { Faker::Commerce.price }
    count_in_stock { Faker::Number.number(2) }
    #category { FactoryGirl.create(attributes_for(:category)) }
    category { FactoryGirl.create(:category) }
    author { FactoryGirl.create(:author) }
  end
end
