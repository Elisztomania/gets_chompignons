class Mushroom < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  CAP = %w(Convexe Entonnoir Globuleux Plat Déprimé Mamelonné Cylindrique Verruqueuse)
  LOCATIONS = ['Bois de feuillus', 'Bois de conifères', 'Bois de feuillus et conifères', 'Lisières', 'Prés', 'Souches', 'Mousse', 'Bois pourrissant', 'Sol pas ou peu calcaire', 'Sol calcaire', 'Forêt enchantée']

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :location, presence: true, inclusion: { in: LOCATIONS }
  validates :cap, inclusion: { in: CAP }
  validates :user, presence: true

  def average_rating
    if reviews.count == 0
      return 0
    else
    nbreviews = 0
    sum = 0
    reviews.each do |review|
      sum += review.rating
      nbreviews += 1
    end
      sum.fdiv(nbreviews).round(1) unless nbreviews.zero?
    end
  end
end
