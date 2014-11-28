class Order < ActiveRecord::Base
  enum state: ['in progress', 'completed', 'shipped']
  belongs_to :customer
  belongs_to :credit_card
  has_many :order_items
  validates :customer, :credit_card, :completed_at, :state, presence: true
  validates :total_price, numericality: {:greater_than_or_equal_to => 0}, allow_blank: true

  #belongs_to :address, :foreign_key => 'billing_address_id'
  #belongs_to :address, :foreign_key => 'shipping_address_id'
  belongs_to :billing_address, class_name: 'Address'
  belongs_to :shipping_address, class_name: 'Address'
  validates :billing_address, :shipping_address, presence: true

  # test db doesn't change after db:rollback and db:migrate
  # so it is possible to use callback for such situation
  #after_initialize :init
  #def init
  #  self.total_price ||= 0.0
  #end
end
