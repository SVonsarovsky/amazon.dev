class Author < ActiveRecord::Base
  has_many :books
  validates_associated :books
  validates :firstname, :lastname, presence: true
end
