class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    @review.worth_it = params[:worth_it]
    @review.comment = params[:comment]
    @review.user_id = current_user.id
    @review.restaurant_id = params[:restaurant_id]
    @review.save 
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :restaurant_id, :woth_it, :comment)
  end
end
