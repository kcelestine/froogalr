class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def search 
    @restaurants = Restaurant.where("zip_code = '#{params[:zip_code]}'")
  end
end
