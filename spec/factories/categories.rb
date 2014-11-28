#class Category < ActiveRecord::Base
#  has_many :books
#  validates_associated :books
#  validates :title, presence: true, uniqueness: true
#end
FactoryGirl.define do
  sequence :title do |n|
    "Category ##{n}"
  end

  factory :category do
    title { FactoryGirl.generate(:title) }
  end
end

=begin
FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    #email { FactoryGirl.generate(:email) }
    #first_name "John Doe"
    email { Faker::Internet.email }
    first_name { Faker::Name.name }
    admin false

    factory :admin do
      admin true
    end

    factory :author do
      #ignore do
      transient do
        posts_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end

  factory :post do
    #title "Post title"
    title { Faker::Lorem.sentence }
    user
  end
end
=end