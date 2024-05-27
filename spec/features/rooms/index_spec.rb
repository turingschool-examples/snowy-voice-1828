require "rails_helper"

# Story 3
# Rooms Index
# As a visitor
# When I visit the rooms index page
# Then I see a list of all rooms
# including the room's suite, nightly rate, and the name of the hotel that it belongs to
# and the number of guests that have stayed in that room.

RSpec.describe "the rooms index page" do
  context "as a visitor" do 
    it "I see a list of all rooms" do
      hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
      hotel_2 = Hotel.create!(name: 'White Lotus', location: 'Maui')
      room_2 = hotel_2.rooms.create!(rate: 1500, suite: "Pineapple")

      visit "/rooms"
      # save_and_open_page
      expect(page).to have_content(room_1.suite)
      expect(page).to have_content(room_1.rate)
      expect(page).to have_content(room_1.hotel.name)
      expect(page).to have_content(room_2.suite)
      expect(page).to have_content(room_2.rate)
      expect(page).to have_content(room_2.hotel.name)
    end

    it "shows numebr of guests that have stayed in that room" do
      hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
      hotel_2 = Hotel.create!(name: 'White Lotus', location: 'Maui')
      room_2 = hotel_2.rooms.create!(rate: 1500, suite: "Pineapple")
      guest_1 = Guest.create!(name: "Jim James")
      guest_2 = Guest.create!(name: "Bob Dylan")
      guest_3 = Guest.create!(name: "Paul Simon")
      RoomsGuest.create!(room: room_1, guest: guest_1)
      RoomsGuest.create!(room: room_1, guest: guest_2)
      RoomsGuest.create!(room: room_1, guest: guest_3)
      RoomsGuest.create!(room: room_2, guest: guest_1)
      # binding.pry

      visit "/rooms"
      save_and_open_page
      expect(page).to have_content("Number of guests: 3")
      expect(page).to have_content("Number of guests: 1")
    end
  end
end
