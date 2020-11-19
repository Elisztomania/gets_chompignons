class MushroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_mushroom, only: [:show, :edit, :update, :average_rating]

  def index
    @mushrooms = Mushroom.all
  end

  def new
    @mushroom = Mushroom.new
  end

  def show
    @favorite = @mushroom.favorites.find_by(user: current_user)
    @average = average_rating
  end

  def create
    @mushroom = Mushroom.new(mushroom_params)
    @mushroom.user = current_user
    if @mushroom.save
      redirect_to @mushroom, notice: 'Mushroom was successfully created 🍄'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @mushroom.update(mushroom_params)
      redirect_to @mushroom, notice: 'Mushroom was successfully updated 🍄'
    else
      render :edit
    end
  end

  def show_my
    @mymushrooms = Mushroom.where(user: current_user)
  end

  def average_rating
    # return unless @mushroom.reviews != 0

    nbreviews = 0
    sum = 0
    @mushroom.reviews.each do |review|
      sum += review.rating
      nbreviews += 1
    end
    @average = sum.fdiv(nbreviews).round(1)
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
  end

  def mushroom_params
    params.require(:mushroom).permit(:name, :content, :location, :eatable, :cap, :user_id, :photo)
  end
end
