class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workshop

  validates :num_guests, presence: true
  validates :num_guests, numericality: { only_integer: true }
end
