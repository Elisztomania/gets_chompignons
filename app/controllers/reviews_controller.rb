class ReviewsController < ApplicationController

  def create
    @mushroom = Mushroom.find(params[:mushroom_id])
    @review = Review.new(review_params)
    @review.mushroom = @mushroom
    if @review.save
      redirect_to mushroom_path(@mushroom)
    else
      render :new
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
