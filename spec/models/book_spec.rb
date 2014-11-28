require 'rails_helper'

RSpec.describe Book, :type => :model do

  let(:book) { FactoryGirl.create(:book) }

  it 'has a title' do
    expect(book).to validate_presence_of(:title)
  end

  it 'has a price' do
    expect(book).to validate_presence_of(:price)
  end

  it 'has a count in stock' do
    expect(book).to validate_presence_of(:count_in_stock)
  end

  it 'has a category' do
    expect(book).to validate_presence_of(:category)
  end

  it 'belongs to category' do
    expect(book).to belong_to(:category)
  end

  it 'has a author' do
    expect(book).to validate_presence_of(:author)
  end

  it 'belongs to author' do
    expect(book).to belong_to(:author)
  end

  it 'has many ratings' do
    expect(book).to have_many(:ratings)
  end

end