require 'rails_helper'

RSpec.describe Rating, :type => :model do

  let(:rating) { FactoryGirl.create(:rating) }

  it 'has a customer' do
    expect(rating).to validate_presence_of(:customer)
  end

  it 'belongs to customer' do
    expect(rating).to belong_to(:customer)
  end

  it 'has a book' do
    expect(rating).to validate_presence_of(:book)
  end

  it 'belongs to book' do
    expect(rating).to belong_to(:book)
  end

  it 'has a text' do
    expect(rating).to validate_presence_of(:text)
  end

  it 'has a rating' do
    expect(rating).to validate_presence_of(:rating)
  end

  it 'has a rating which is between 1 and 10' do
    expect(rating.rating).to be_between(1, 10)
  end

end