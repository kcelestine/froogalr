require 'factual'

#destroys all restaurants in database before seeding
# Restaurant.destroy_all

#keys for restaurant calls
factual_api_key = ENV["FACTUAL_API_KEY"]
factual_api_secret = ENV["FACTUAL_API_SECRET"]
factual = Factual.new("#{factual_api_key}", "#{factual_api_secret}")

#keys for crosswalk calls
# crosswalk_api_key = ENV["CROSSWALK_API_KEY"]
# crosswalk_api_secret = ENV["CROSSWALK_API_SECRET"]
# crosswalk = Factual.new("#{crosswalk_api_key}", "#{crosswalk_api_secret}")

#queens zips
# zip_codes = [
# 11692,
# 11102,
# 11359,
# 11426,
# 11697,
# 11411,
# 11356,
# 11368,
# 11369,
# 11373,
# 11690,
# 11002,
# 11351,
# 11375,
# 11365,
# 11004,
# 11423,
# 11313,
# 11372,
# 11405,
# 11415,
# 11362,
# 11101,
# 11378,
# 11379,
# 11364,
# 11416,
# 11427,
# 11374,
# 11418,
# 11385,
# 11694,
# 11422,
# 11412,
# 11420,
# 11419,
# 11413,
# 11104,
# 11357,
# 11421,
# 11377]

#manhattan zips
# zip_codes = [
#   10026,
#   10027,
#   10030,
#   10037,
#   10039,
#   10001,
#   10011,
#   10018,
#   10019,
#   10020,
#   10036,
#   10029,
#   10035,
#   10010,
#   10016,
#   10017,
#   10022,
#   10012,
#   10013,
#   10014,
#   10004,
#   10005,
#   10006,
#   10007,
#   10038,
#   10280,
#   10002,
#   10003,
#   10009,
#   10021,
#   10028,
#   10044,
#   10128,
#   10023,
#   10024,
#   10025,
#   10031,
#   10032,
#   10033,
#   10034,
#   10040]

zip_codes.each do |zip|

  # gets restaurants for each zipcode
  restaurant_info_hash = factual.table("restaurants").filters({:country => "US", :price => 1, :postcode => zip}).limit(50)
    restaurant_info_hash.each do |restaurant|
  
#     # gets seamless and yelp urls for each restaurant by factual id
#     # seamless_hash = crosswalk.table("crosswalk").filters(:factual_id => restaurant["factual_id"],:namespace => { "$in" => [:seamless] })
#     # yelp_hash = crosswalk.table("crosswalk").filters(:factual_id => restaurant["factual_id"],:namespace => { "$in" => [:yelp] })

#       # iterates through seamless and yelp urls to put in new restaurant
#       # seamless_hash.each do |seamless|
#       #   yelp_hash.each do |yelp|

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
            factual_id: restaurant["factual_id"])
      #   end
      # end
    end
  sleep(1)
end

# restaurants_hash = Restaurant.all 
# restaurants_hash.each do |restaurant|

#   seamless_hash = factual.table("crosswalk").filters(:factual_id => restaurant["factual_id"],:namespace => { "$in" => [:seamless] })
#   seamless_hash.each do |seamless|
#     restaurant.update(seamless: seamless['url'])
#   end
#   sleep(1)
# end

# restaurants = Restaurant.all 
# restaurants.each do |restaurant|

#   seamless_hash = crosswalk.table("crosswalk").filters(:factual_id => restaurant["factual_id"],:namespace => { "$in" => [:yelp] })
#   seamless_hash.each do |yelp|
#     restaurant.update(yelp: yelp['url'])
#   end
# end