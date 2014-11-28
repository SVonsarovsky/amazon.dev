require 'rails_helper'

RSpec.describe CreditCard, :type => :model do

  let(:credit_card) { FactoryGirl.create(:credit_card) }

  it 'has a customer' do
    expect(credit_card).to validate_presence_of(:customer)
  end

  it 'belongs to customer' do
    expect(credit_card).to belong_to(:customer)
  end

  it 'has many orders' do
    expect(credit_card).to have_many(:orders)
  end

  it 'has a number' do
    expect(credit_card).to validate_presence_of(:number)
  end

  it 'has a CVV code' do
    expect(credit_card).to validate_presence_of(:cvv)
  end

  it 'has a expiration_month' do
    expect(credit_card).to validate_presence_of(:expiration_month)
  end

  it 'has a expiration_year' do
    expect(credit_card).to validate_presence_of(:expiration_year)
  end

  it 'has a first name' do
    expect(credit_card).to validate_presence_of(:firstname)
  end

  it 'has a last name' do
    expect(credit_card).to validate_presence_of(:lastname)
  end

end
