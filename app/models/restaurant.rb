class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :reviews

  validates_presence_of :zip_code, :name, :latitude, :longitude, :address

  scope :where_zip, -> (term) { where("restaurants.zip_code = ?", term)}

  # def hasRestaurant(user_id, restaurant_id)
  #   user = User.find(user_id)
  #   restaurant = Restaurant.find(restaurant_id)
  #
  #   restaurants_id = user.restaurants.map do |restaurant|
  #     restaurant.id
  #   end
  #   restaurants_id.include?(restaurant_id)
  # end

  

end
