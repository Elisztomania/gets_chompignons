class AddMushroomToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :mushroom, null: false, foreign_key: true
  end
end
