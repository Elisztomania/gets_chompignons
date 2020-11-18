class FavoritesController < ApplicationController

  def index
    @favorite = Mushroom.find(params[:id])
  end


end
