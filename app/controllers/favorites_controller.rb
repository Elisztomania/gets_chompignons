class FavoritesController < ApplicationController
  before_action :set_mushroom, only: [:create, :destroy]

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.mushroom = @mushroom

    if @favorite.save
      redirect_to @mushroom, notice: 'Vous avez ajouté un 🍄 à vos favoris'
    else
      render :new
    end
  end

  def destroy
  end

  def show
    @mushrooms = Mushroom.all
    @user_id = current_user.id
    @favorites = Mushroom.where(user_id: @user_id)
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:id])
  end
end
