class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @reviews = @restaurant.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(restaurant)
    else
      render "restaurant/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
