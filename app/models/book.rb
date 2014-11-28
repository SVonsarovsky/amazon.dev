class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :ratings
  validates :category, :author, presence: true
  validates :title, :price, :count_in_stock, presence: true
end
