FactoryGirl.define do
  factory :order do
    customer { FactoryGirl.create(:customer) }
    credit_card { FactoryGirl.create(:credit_card) }
    completed_at { Time.now }
    billing_address { FactoryGirl.create(:address) }
    shipping_address { FactoryGirl.create(:address) }
  end
end