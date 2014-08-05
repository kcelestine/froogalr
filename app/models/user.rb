class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable
  
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :restaurants

  validates_presence_of :first_name, :last_name, :username, :email, :encrypted_password
  validates_uniqueness_of :username, :email

  def addFavorite
    @user = User.find(current_user)
    @restaurant = Restaurant.find(params(:restaurant_id))
    @user.restaurants << @restaurant
  end

end
