class Photo < ApplicationRecord
  belongs_to :workshop
  mount_uploader :image, PhotoUploader
  validates :image, presence: true
end
