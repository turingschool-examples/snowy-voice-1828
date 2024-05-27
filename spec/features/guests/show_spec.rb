require "rails_helper"

# Story 1
# Guest Show
# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.

RSpec.describe "the guests show page" do
  context "as a visitor" do 
    it "I see the guest's name" do 
      guest_1 = Guest.create!(name: "Jim James")
    
      visit "/guests/#{guest_1.id}"

      expect(page).to have_content(guest_1.name)
    end

    it "I see a list of all rooms they've stayed in including suite, rate, and name of hotel it belongs to" do 
      guest_1 = Guest.create!(name: "Jim James")
      hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
      RoomsGuest.create!(room: room_1, guest: guest_1)
      visit "/guests/#{guest_1.id}"

      expect(page).to have_content(room_1.suite)
      expect(page).to have_content(room_1.rate)
      expect(page).to have_content(room_1.hotel.name)
    end
  end
end