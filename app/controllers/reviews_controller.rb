class ReviewsController < ApplicationController
  before_action :set_mushroom, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.mushroom = @mushroom
    if @review.save
      redirect_to mushroom_path(@mushroom)
    else
      render :new
    end
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, :mushroom_id)
  end
end
