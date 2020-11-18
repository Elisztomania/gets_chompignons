class Favorite < ApplicationRecord
  belongs_to :mushroom
  belongs_to :user
end
