class Customer < ActiveRecord::Base
  has_many :ratings
  has_many :orders
  has_many :credit_cards
  validates :password, :firstname, :lastname, presence: true
  validates :email, presence: true, uniqueness: true

  #A customer should be able to create a new order
  #A customer should be able to return a current order in progress
end
