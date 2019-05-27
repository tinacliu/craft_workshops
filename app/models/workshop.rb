class Workshop < ApplicationRecord
  LEVEL = ["Beginner", "Intermediate", "Advanced"]
  CATEGORY = ["Calligraphy", "Ceramics", "Floristry", "Glass", "Jewellery", "Leather", "Paper", "Wood"]

  belongs_to :owner_id
  has_many :photos
  has_many :bookings
  has_many :users, through: :bookings

  validates :name, :description, :address, :price, :date_time, :capacity, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :level, inclusion: { in: LEVEL }
  validates :capacity, :price, numericality: { only_integer: true }
end
