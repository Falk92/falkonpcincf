FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "testpassword"
    password_confirmation { |u| u.password }
    admin false
    first_name "Falk"
    last_name "H"
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email
    password "testpassword"
    password_confirmation { |u| u.password }
    admin true
    first_name "Admin"
    last_name "User"
  end
end