class Guest < ApplicationRecord
  has_many :rooms_guests
  has_many :rooms, through: :rooms_guests

  # def room_list
  #   self.rooms.each do |room|
  #     room.name
  #   end
  # end
end