class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def search
    zip = params[:search]
    @restaurants = Restaurant.where_zip(zip).to_json.html_safe
  end

  def addFavorite
    @user = User.find(current_user)
    # binding.pry
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user.restaurants << @restaurant
  end

end
