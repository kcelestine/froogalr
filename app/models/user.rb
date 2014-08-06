class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :restaurants

  validates_presence_of :first_name, :last_name, :username, :email, :encrypted_password
  validates_uniqueness_of :username, :email

  def self.hasRestaurant(user_id, restaurant_id)
    user = User.find(user_id)
    restaurant = Restaurant.find(restaurant_id)

    restaurants_id = user.restaurants.map do |restaurant|
      restaurant.id
    end
    restaurants_id.include?(restaurant_id)
  end

  def favorite(restaurant)
    unless self.restaurants.include? restaurant
      self.restaurants.push restaurant
    end
  end

  def unfavorite(restaurant)
    if self.restaurants.include? restaurant
      self.restaurants.destroy(restaurant)
    end
  end
end
