require 'rails_helper'

RSpec.describe Order, :type => :model do

  let(:order) { FactoryGirl.create :order }

  it 'has a total price' do
    expect(order.total_price).not_to be_nil
  end

  it 'has a total price which is numeric' do
    expect(order).to validate_numericality_of(:total_price)
  end

  it 'has a total price bigger than or equal to 0' do
    expect(order.total_price).to be >= 0
  end

  it 'is able to return a total price of the order' do
    expect(order).to respond_to :total_price
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

  it 'belongs to billing address' do
    expect(order).to belong_to(:billing_address)
  end

  it 'has a shipping address' do
    expect(order).to validate_presence_of(:shipping_address)
  end

  it 'belongs to shipping address' do
    expect(order).to belong_to(:shipping_address)
  end

  context '#add_book' do
    it 'is able to add a book to the order' do
      book = FactoryGirl.create(:book)
      order.add_book(book)
      expect(order.order_items.where(book: book).count).to eq 1
    end

    it 'is able to add the same book by increasing its quantity in order item' do
      book = FactoryGirl.create(:book)
      order.add_book(book)
      order.add_book(book)
      expect(order.order_items.where(book: book).count).to eq 1
    end
  end

  context '#update_total_price' do
    it 'updates total price' do
      book = FactoryGirl.create(:book)
      #order.add_book(book)
      order.update_total_price
      expect(order.total_price).to eq order.order_items.inject(0){|sum, item| sum+item.price*item.quantity}
    end
  end

end