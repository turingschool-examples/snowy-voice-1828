class Hotel < ApplicationRecord
  has_many :rooms

  # def unique_guests
  #   uniqueguests = []
  #   rooms.each do |room|
  #     room.guests.each do |guest|
  #       uniqueguests << guest.name
  #     end
  #   end
  # end
end