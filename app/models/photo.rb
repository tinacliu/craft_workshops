class Photo < ApplicationRecord
  belongs_to :workshop_id

  validates :image, precence: true
end
