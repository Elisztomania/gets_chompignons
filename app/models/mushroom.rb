class Mushroom < ApplicationRecord
  belongs_to :user

  CAP = %w(Convexe Entonnoir Globuleux Plat Déprimé Mamelonné)
  LOCATIONS = ['Bois de feuillus', 'Bois de conifères', 'Bois de feuillus et conifères', 'Lisières', 'Prés', 'Souches', 'Mousse', 'Bois pourrissant', 'Sol pas ou peu calcaire', 'Sol calcaire']

  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
  validates :location, presence: true, inclusion: { in: LOCATIONS }
  validates :cap, inclusion: { in: CAP }
  validates :user, presence: true
end
