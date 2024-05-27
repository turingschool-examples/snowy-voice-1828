class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guests, through: :guest_rooms

  def guest_count
    guests.count
  end

  def room_guests
    guests.pluck(:name)
  end
end