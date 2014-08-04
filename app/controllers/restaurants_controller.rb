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
end
