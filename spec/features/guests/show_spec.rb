require 'rails_helper'

RSpec.describe 'the guest show page' do
  before do
    @hotel = Hotel.create(name: 'Hilton', location: 'Denver')
    @room = @hotel.rooms.create(rate: 125, suite: 'presidential', hotel_id: @hotel.id)
    @room2 = @hotel.rooms.create(rate: 100, suite: 'king', hotel_id: @hotel.id)
    @guest = Guest.create(name: 'John', nights: 3)
    @guest_room = GuestRoom.create(guest_id: @guest.id, room_id: @room.id)
  end

  describe 'as a visitor' do
    it 'shows a visitor and all the rooms that they have stayed in' do
      visit "/guests/#{@guest.id}"

      expect(page).to have_content("Name: #{@guest.name}")
      expect(page).to have_content("Hotel: #{@hotel.name}")
      expect(page).to have_content("Room: #{@room.suite}")
      expect(page).to have_content("Rate: #{@room.rate}")
    end

    it 'contains a form to add a room to guest' do
      visit "/guests/#{@guest.id}"

      expect(page).to have_content('Add a Room')

      fill_in 'Room ID:', with: @room2.id

      click_button 'Submit'

      expect(current_path).to eq("/guests/#{@guest.id}")
      expect(page).to have_content(@room2.suite)
    end
  end
end
