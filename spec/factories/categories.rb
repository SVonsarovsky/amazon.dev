FactoryGirl.define do
  sequence :title do |n|
    "Category ##{n}"
  end

  factory :category do
    title { FactoryGirl.generate(:title) }
  end
end
