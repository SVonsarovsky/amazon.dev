class Category < ActiveRecord::Base
  has_many :books
  validates_associated :books
  validates :title, presence: true, uniqueness: true
end
