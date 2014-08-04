require 'factual'

User.destroy_all
Restaurant.destroy_all
FACTUAL_KEY = ENV["FACTUAL_API_KEY"]
FACTUAL_SECRET = ENV["FACTUAL_API_SECRET"]
factual = Factual.new("#{FACTUAL_API_KEY}", "#{FACTUAL_API_SECRET}")
# binding.pry

testuser = User.create(
  first_name: "John",
  last_name: "Smith",
  username: "Test",
  email_address: "test@test.com"
)

# testrestaurant = Restaurant.create(
#   name: "Test",
#   address: "123 Apple St.",
#   latitude: "40.736863",
#   longitude: "-73.982189",
#   zip_code: "10010",
#   telephone: "212 - 228 - 8273",
#   website: "http://www.pandesalny.com",
#   cuisine: "Diner",
#   hours: "Open Daily 7:30 AM-8:00 PM"
# )

zip_codes = [
  10026,
  10027,
  10030,
  10037,
  10039,
  10001,
  10011,
  10018,
  10019,
  10020,
  10036,
  10029,
  10035,
  10010,
  10016,
  10017,
  10022,
  10012,
  10013,
  10014,
  10004,
  10005,
  10006,
  10007,
  10038,
  10280,
  10002,
  10003,
  10009,
  10021,
  10028,
  10044,
  10128,
  10023,
  10024,
  10025,
  10031,
  10032,
  10033,
  10034,
  10040
]


zip_codes.each do |zip|

  restaurant_info_hash = factual.table("restaurants").filters({:country => "US", :price => 1, :postcode => zip}).limit(10)
  # restaurant_info_hash = Factual.restaurant_info(zip)
  restaurant_info_hash.each do |restaurant|
    Restaurant.create(
      name: restaurant["name"],
      address: restaurant["address"],
      latitude: restaurant["latitude"],
      longitude: restaurant["longitude"],
      zip_code: restaurant["postcode"],
      telephone: restaurant["tel"],
      website: restaurant["website"],
      cuisine: restaurant["cuisine"][0],
      hours: restaurant["hours_display"],
      factual_id: restaurant["factual_id"]
    )
  end
  sleep(1)
end
