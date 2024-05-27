class Guest < ApplicationRecord
  has_many :rooms_guests
  has_many :rooms, through: :rooms_guests
end