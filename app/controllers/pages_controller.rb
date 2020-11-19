class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @mushrooms = Mushroom.all
    @top5 = @mushrooms.sort_by {|mushroom| -mushroom.average_rating }.first(5)
  end
end
