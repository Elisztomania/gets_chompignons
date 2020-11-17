class Mushroom < ApplicationRecord
  belongs_to :user

  CAP = %w(Convexe Entonnoir Globuleux Plat Déprimé Mamelonné)

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :location, presence: true
  validates :cap, inclusion: { in: CAP }
  validates :user, presence: true
end
