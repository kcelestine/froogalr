class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize! :create, @review
  end

  def create
    @review = Review.new
    authorize! :create, @review
    @review.worth_it = params[:worth_it]
    @review.comment = params[:comment]
    @review.user_id = current_user.id
    @review.restaurant_id = params[:restaurant_id]
    @review.save
  end

  def edit
    @review = Review.find(params[:id])
    authorize! :update, @review
  end

  def update
    @review = Review.find(params[:id])
    authorize! :update, @review
    @review.update(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    authorize! :destroy, @review
    @review.destroy
  end

  private
  def review_params
    params.permit(:user_id, :restaurant_id, :woth_it, :comment)
  end
end
