class Warrior < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :nickname, :specialty, :race, :weapon, :price, :address, presence: true
  validates :nickname, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
