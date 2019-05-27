class Photo < ApplicationRecord
  belongs_to :workshop_id

  validates :image, presence: true
end
