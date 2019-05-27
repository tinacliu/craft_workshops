class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :workshops_as_student, through: :bookings, source: :workshops
  has_many :workshops, foreign_key: "owner_id"

  has_many :bookings_as_owner, through: :workshops, source: :bookings
end
