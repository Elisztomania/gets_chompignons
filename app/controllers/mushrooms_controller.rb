class MushroomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_mushroom, only: [:show, :edit, :update]

  def index
    @mushrooms = Mushroom.all
  end

  def new
    @mushroom = Mushroom.new
  end

  def show
    @favorite = @mushroom.favorites.find_by(user: current_user)
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
    @mushrooms = Mushroom.all
    @user_id = current_user.id
    @mymushrooms = Mushroom.where(user_id: @user_id)
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
  end

  def mushroom_params
    params.require(:mushroom).permit(:name, :content, :location, :eatable, :cap, :user_id, :photo)
  end
end
