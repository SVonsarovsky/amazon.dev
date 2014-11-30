class OrderItem < ActiveRecord::Base

  belongs_to :book
  belongs_to :order
  validates :book, :order, :price, :quantity, presence: true
  validates :quantity, numericality: {greater_than: 0}

  #after_create do |order_item|
  #  puts 'create'
  #  order_item.order.update_total_price
  #end
  #after_update do |order_item|
  #  puts 'update'
  #  order_item.order.update_total_price
  #end
  after_save do |order_item|
    order_item.order.update_total_price
  end
  after_destroy do |order_item|
    order_item.order.update_total_price
  end
end
