class Order < ActiveRecord::Base
  enum state: ['in progress', 'completed', 'shipped']
  belongs_to :customer
  belongs_to :credit_card
  has_many :order_items
  validates :customer, :credit_card, :completed_at, :state, presence: true
  validates :total_price, numericality: {:greater_than_or_equal_to => 0}, allow_blank: true #написать валидацию на это хорошую

  belongs_to :billing_address, class_name: 'Address'#, foreign_key: 'billing_address_id'
  belongs_to :shipping_address, class_name: 'Address'#, foreign_key: 'shipping_address_id'
  validates :billing_address, :shipping_address, presence: true

  # test db doesn't change after db:rollback and db:migrate
  # so it is possible to use callback for such situation
  #after_initialize :init
  #def init
  #  self.total_price ||= 0.0
  #end

  def add_book(book)
    order = self
    order_item = order.order_items.find_by(:book => book)
    if order_item.nil?
      order_item = OrderItem.new({:book => book, :order => order, :price => book.price, :quantity => 1})
    else
      order_item.quantity += 1
    end
    order_item.save
  end

  def update_total_price
    total_price = 0
    self.order_items.each do |order_item|
      total_price += (order_item.price * order_item.quantity)
    end
    self.total_price = total_price
    self.save
  end
end
