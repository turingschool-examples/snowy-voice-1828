require 'rails_helper'

RSpec.describe 'the guest show' do
  describe 'as a visitor' do
    it 'shows a visitor and all the rooms that they have stayed in' do
      hotel = Hotel.create(name: 'Hilton', location: 'Denver')
      room = hotel.rooms.create(rate: 125, suite: true, hotel_id: hotel.id)
      guest = Guest.create(name: 'John', nights: 3)
      guest_room = GuestRoom.create(guest_id: guest.id, room_id: room.id)

      visit "/guests/#{guest.id}"

      expect(page).to have_content("Name: #{guest.name}")
      expect(page).to have_content("Hotel: #{hotel.name}")
      expect(page).to have_content("Room: #{room.suite}")
      expect(page).to have_content("Nights: #{guest.nights}")
      expect(page).to have_content("Rate: #{room.rate}")
    end
  end
end
