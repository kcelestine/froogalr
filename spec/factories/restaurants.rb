FactoryGirl.define do
  factory :restaurant do
    id 1
    name 'Yummy Fried Chicken'
    address '61 Martense St'
    latitude 40.804661
    longitude -73.955093
    zip_code 10026
    telephone '(212) 218-0318'
    website nil
    cuisine 'Chicken'
    hours 'Open Daily 11:00 AM-11:00 PM'
  end
end
