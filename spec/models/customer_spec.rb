require 'rails_helper'

RSpec.describe Customer, :type => :model do

  let(:customer) { FactoryGirl.create :customer }

  it 'has an email' do
    expect(customer).to validate_presence_of(:email)
  end

  it 'has a unique email' do
    expect(customer).to validate_uniqueness_of(:email)
  end

  it 'has a password' do
    expect(customer).to validate_presence_of(:password)
  end

  it 'has a firstname' do
    expect(customer).to validate_presence_of(:firstname)
  end

  it 'has a lastname' do
    expect(customer).to validate_presence_of(:lastname)
  end

  it 'has many ratings' do
    expect(customer).to have_many(:ratings)
  end

  it 'has many orders' do
    expect(customer).to have_many(:orders)
  end

  it 'has many credit_cards' do
    expect(customer).to have_many(:credit_cards)
  end

  it 'is able to create a new order' do
    customer.orders.create(FactoryGirl.attributes_for(:order))
    expect(customer.orders.count).to eq 1
  end

  it 'is able to return a current order in progress' do
    customer.orders.create(FactoryGirl.attributes_for(:order))
    expect(customer.orders.find_by state: 'in progress').not_to be_nil
  end

end
