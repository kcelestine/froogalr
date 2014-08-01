User.destroy_all
Restaurant.destroy_all

testuser = User.create(
  first_name: "John",
  last_name: "Smith",
  username: "Test",
  email_address: "test@test.com"
)

testrestaurant = Restaurant.create(
  name: "Test",
  address: "123 Apple St.",
  latitude: "40.736863",
  longitude: "-73.982189",
  zip_code: "10010",
  telephone: "212 - 228 - 8273",
  website: "http://www.pandesalny.com",
  cuisine: "Diner",
  hours: "Open Daily 7:30 AM-8:00 PM"
)
