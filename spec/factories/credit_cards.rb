FactoryGirl.define do
  factory :credit_card do
    customer { FactoryGirl.create(:customer) }
    number { Faker::Business.credit_card_number }
    cvv { Faker::Number.number(3) }
    expiration_year { Faker::Business.credit_card_expiry_date.year }
    expiration_month { Faker::Business.credit_card_expiry_date.month }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
  end
end