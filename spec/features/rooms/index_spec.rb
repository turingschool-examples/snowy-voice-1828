require 'rails_helper'

RSpec.describe 'the room index page' do
  before do
    @hotel = Hotel.create(name: 'Hilton', location: 'Denver')
    @room = @hotel.rooms.create(rate: 125, suite: 'presidential', hotel_id: @hotel.id)
    @room2 = @hotel.rooms.create(rate: 100, suite: 'king', hotel_id: @hotel.id)
    @guest = Guest.create(name: 'John', nights: 3)
    @guest_room = GuestRoom.create(guest_id: @guest.id, room_id: @room.id)
    @guest_room2 = GuestRoom.create(guest_id: @guest.id, room_id: @room2.id)
  end

  describe 'as a visitor' do
    it 'shows all rooms' do
      visit '/rooms'
      save_and_open_page
      expect(page).to have_content("Suite: #{@room.suite}")
      expect(page).to have_content("Rate: #{@room.rate}")
      expect(page).to have_content("Hotel: #{@hotel.name}")
      expect(page).to have_content("Guest Count: #{@room.guest_count}")

      expect(page).to have_content("Suite: #{@room2.suite}")
      expect(page).to have_content("Rate: #{@room2.rate}")
      expect(page).to have_content("Hotel: #{@hotel.name}")
      expect(page).to have_content("Guest Count: #{@room2.guest_count}")
    end
  end
end
