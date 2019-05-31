class Photo < ApplicationRecord
  belongs_to :workshop
  mount_uploader :image, PhotoUploader
end
