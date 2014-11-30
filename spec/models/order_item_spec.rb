require 'rails_helper'

RSpec.describe OrderItem, :type => :model do

  let(:order_item) { FactoryGirl.create(:order_item) }

  it 'has a book' do
    expect(order_item).to validate_presence_of(:book)
  end

  it 'belongs to book' do
    expect(order_item).to belong_to(:book)
  end

  it 'has an order' do
    expect(order_item).to validate_presence_of(:order)
  end

  it 'belongs to order' do
    expect(order_item).to belong_to(:order)
  end

  it 'has a price' do
    expect(order_item).to validate_presence_of(:price)
  end

  it 'has a quantity' do
    expect(order_item).to validate_presence_of(:quantity)
  end

  it 'has a quantity greater than 0' do
    expect(order_item.quantity).to be > 0
  end

  context 'changes order total price' do
    let(:order) { FactoryGirl.create(:order) }
    let(:book) { FactoryGirl.create(:book) }

    #it 'after create' do
    #  expect(order).to receive(:update_total_price)#.at_least 1
    #  order_item = OrderItem.create({:book => book, :order => order, :price => book.price, :quantity => 1})
    #end
    #it 'after update' do
    #  expect(order_item.order).to receive(:update_total_price)#.at_least 1
    #  order_item.quantity += 1 #updating
    #  order_item.save
    #end
    it 'after save' do
      order_item = OrderItem.new({:book => book, :order => order, :price => book.price, :quantity => 1})
      expect(order).to receive(:update_total_price)
      order_item.save
    end
    it 'after destroy' do
      expect(order_item.order).to receive(:update_total_price)
      order_item.destroy
    end
  end

end