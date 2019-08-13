class Warrior < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :nickname, :specialty, :race, :weapon, :price, :address, presence: true
  validates :nickname, uniqueness: true
end
