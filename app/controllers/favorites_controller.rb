class FavoritesController < ApplicationController
  before_action :set_mushroom, only: [:create]

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
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to mushroom_path(@favorite.mushroom), notice: 'Vous avez supprimé ce 🍄 à vos favoris'
  end

  def show
    @favorites = Favorite.where(user: current_user)
    @fav_champ = []
    @favorites.each do |fav|
      champ = Mushroom.find(fav.mushroom_id)
      @fav_champ << champ
    end
  end

    # @mushrooms = Mushroom.all
    # @mymushrooms = Mushroom.where(user: current_user)

  private

  def set_mushroom
    @mushroom = Mushroom.find(params[:mushroom_id])
  end
end
