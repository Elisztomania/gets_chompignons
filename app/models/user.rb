class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :mushrooms, through: :favorites, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :username, uniqueness: true
end
