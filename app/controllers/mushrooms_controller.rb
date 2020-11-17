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
  end

  def create
    @mushroom = Mushroom.new(mushroom_params)
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

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
  end

  def mushroom_params
    params.require(:mushroom).permit(:name, :content, :location, :eatable, :cap, :user_id)
  end
end
