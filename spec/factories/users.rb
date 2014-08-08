FactoryGirl.define do
  factory :user do
      id 3
      username 'tone'
      first_name 'tOne'
      last_name 'tTwo'
      email 'to@t.co'
      password 'password'
      password_confirmation 'password'
    factory :user1 do
      id 1
      username 'one'
      first_name 'One'
      last_name 'Two'
      email 'o@t.co'
      password 'password'
      password_confirmation 'password'
    end

    factory :maurisa do
      id 2
      username 'maurisa7'
      first_name 'Maurisa'
      last_name 'Charles'
      email 'k@c.co'
      password 'password'
      password_confirmation 'password'
    end
  end

  factory :confirmed_user, :parent => :user1 do
    after(:create) { |user| user.confirm! }
  end
  factory :confirmed_user2, :parent => :maurisa do
    after(:create) { |maurisa| maurisa.confirm! }
  end
end
