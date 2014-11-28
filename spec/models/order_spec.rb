require 'rails_helper'

RSpec.describe Order, :type => :model do

  let(:order) { FactoryGirl.create :order }

  it 'has a total price' do
    expect(order.total_price).not_to be_nil
  end

  it 'has a completed date' do
    expect(order).to validate_presence_of(:completed_at)
  end

  it 'has a state' do
    expect(order).to validate_presence_of(:state)
  end

  it 'has a default state "in progress"' do
    expect(order.state).to eq 'in progress'
  end

  it 'has a customer' do
    expect(order).to validate_presence_of(:customer)
  end

  it 'belongs to customer' do
    expect(order).to belong_to(:customer)
  end

  it 'has a credit card' do
    expect(order).to validate_presence_of(:customer)
  end

  it 'belongs to credit card' do
    expect(order).to belong_to(:credit_card)
  end

  it 'has many order items' do
    expect(order).to have_many(:order_items)
  end

  it 'has a billing address' do
    expect(order).to validate_presence_of(:billing_address)
  end

  it 'has a shipping address' do
    expect(order).to validate_presence_of(:shipping_address)
  end

  it 'is able to add a book to the order' do
    book = FactoryGirl.create(:book)
    order.order_items.create({:book => book, :order => order, :price => 10.0, :quantity => 1})
    expect(order.order_items.first.book).to eq book
  end

  it 'is able to return a total price of the order' do
    expect(order).to respond_to :total_price
  end

end