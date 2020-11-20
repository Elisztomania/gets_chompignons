class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @mushrooms = Mushroom.all
    @top5 = @mushrooms.sort_by {|mushroom| -mushroom.average_rating }.first(5)
  end
end
