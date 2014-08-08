FactoryGirl.define do
  factory :review do
    restaurant_id 1 
    user_id 1
    comment 'yes' 
    worth_it 3
  end
  factory :r1, parent: :review do
    comment 'yes' 
    worth_it 4
  end 
  factory :r2, parent: :review do
    comment 'yes' 
    worth_it 5
  end 
  factory :r3, parent: :review do
    comment 'yes' 
    worth_it 3
  end 
  factory :r4, parent: :review do
    comment 'yes' 
    worth_it 4
  end 
end
