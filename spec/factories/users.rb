FactoryGirl.define do
  factory :user do
    username 'one'
    first_name 'One'
    last_name 'Two'
    email 'o@t.co'
    password 'password'
    password_confirmation 'password'
  end
  factory :maurisa do
    username 'maurisa7'
    first_name 'Maurisa'
    last_name 'Charles'
    email 'k@c.co'
    password 'password'
    password_confirmation 'password'
  end
  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm! }
  end
end
