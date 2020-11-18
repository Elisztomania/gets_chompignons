class Review < ApplicationRecord
  belongs_to :mushroom
  validates :content, presence: true
  validates :rating, presence: true
end
