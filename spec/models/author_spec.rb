require 'rails_helper'

RSpec.describe Author, :type => :model do

  let(:author) { FactoryGirl.create :author }

  it 'has a first name' do
    expect(author).to validate_presence_of(:firstname)
  end

  it 'has a last name' do
    expect(author).to validate_presence_of(:lastname)
  end

  it 'has many books' do
    expect(author).to have_many(:books)
  end

end