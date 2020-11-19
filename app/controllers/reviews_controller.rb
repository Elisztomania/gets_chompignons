class ReviewsController < ApplicationController
  before_action :set_mushroom, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.mushroom = @mushroom
    @review.user = current_user
    if @review.save
      redirect_to @mushroom
    else
      render :new
    end
  end

  def edit
    @mushroom = Mushroom.find(params[:id])
    @review = Review.find(params[:mushroom_id])
  end

  def update
    @mushroom = Mushroom.find(params[:mushroom_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @mushroom, notice: 'Votre avis a été correctement modifié.'
    else
      render :edit
    end
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, :mushroom_id, :user_id)
  end
end
