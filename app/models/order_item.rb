class OrderItem < ActiveRecord::Base

  belongs_to :book
  belongs_to :order
  validates :book, :order, :price, :quantity, presence: true

  after_create do |order_item|
    order_item.order.total_price += order_item.price
    order_item.order.save
  end
end
