class Warrior < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :nickname, :specialty, :race, :weapon, :price, :photo, :address, presence: true
  validates :nickname, uniqueness: true
end
