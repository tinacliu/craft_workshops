class Photo < ApplicationRecord
  belongs_to :workshop

  validates :image, presence: true
end
