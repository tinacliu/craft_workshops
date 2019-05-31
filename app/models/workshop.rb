class Workshop < ApplicationRecord
  LEVEL = ["Beginner", "Intermediate", "Advanced"]
  CATEGORY = ["Calligraphy", "Ceramics", "Floristry", "Glass", "Jewellery", 'Pottery', "Leather", "Paper", "Wood"]
  DURATION = [30, 45, 60, 120, 180, 210]

  belongs_to :owner, class_name: "User"
  has_many :photos
  has_many :bookings
  has_many :users, through: :bookings

  validates :name, :description, :address, :price, :date_time, :capacity, :duration, presence: true
  validates :category, inclusion: { in: CATEGORY }
  validates :level, inclusion: { in: LEVEL }
  validates :capacity, :price, :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  accepts_nested_attributes_for :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def spaces_left
    booked_guests = 0
    bookings.each do |guest|
      booked_guests += guest.num_guests
    end
    capacity - booked_guests
  end
end
