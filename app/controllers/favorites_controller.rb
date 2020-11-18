class FavoritesController < ApplicationController
  before_action :set_mushroom, only: [:create, :destroy]

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.mushroom = @mushroom

    if @favorite.save
      redirect_to @mushroom, notice: 'Vous avez ajouté ce 🍄 à vos favoris'
    else
      render :new
    end
  end

  def destroy
    # @favorite.mushroom = @mushroom
    @favorite.destroy
    redirect_to mushroom_path(@mushroom), notice: 'Vous avez supprimé ce 🍄 à vos favoris'
  end

  def show
    @mushrooms = Mushroom.all
    @user_id = current_user.id
    @favorites = Mushroom.where(user_id: @user_id)
  end

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end
end
