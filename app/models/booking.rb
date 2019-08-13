class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :warrior
  validates :place, :start_date, :end_date, presence: true
end
