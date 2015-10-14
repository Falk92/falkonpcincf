FactoryGirl.define do 
  factory :comment do
    user
    body "Comment!"
    rating 5.0
    association :product, factory: :product
  end
end