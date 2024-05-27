require "rails_helper"

RSpec.describe "Room Index Page" do
    describe "As a visitor" do
    # Story 3
    # Rooms Index

    # As a visitor
    # When I visit the rooms index page
    # Then I see a list of all rooms
    # including the room's suite, nightly rate, and the name of the hotel that it belongs to
    # and the number of guests that have stayed in that room.
        scenario "I see a list of all rooms including the room's suite, nightly rate, and the name of the hotel that it belongs to and the number of guests that have stayed in that room." do
            hotel = Hotel.create!(name: "Marriott", location: "Jakarta")
            room = hotel.rooms.create!(suite: "A1", rate: 100)
            room2 = hotel.rooms.create!(suite: "A2", rate: 150)

            guest = Guest.create!(name: "Garrett Bowman", nights: 3)
            guest2 = Guest.create!(name: "John Banks", nights: 2)
            guest3 = Guest.create!(name: "Will James", nights: 5)

            guest.add_room(room.id)

            guest2.add_room(room.id)

            guest3.add_room(room2.id)


            visit "/rooms"

            within("#room_#{room.id}") do
                expect(page).to have_content(room.suite)
                expect(page).to have_content("Rate: #{room.rate}")
                expect(page).to have_content("Hotel: #{hotel.name}")
                expect(page).to have_content("Number of Guests: 2")
            end

            within("#room_#{room2.id}") do
                expect(page).to have_content(room2.suite)
                expect(page).to have_content("Rate: #{room2.rate}")
                expect(page).to have_content("Hotel: #{hotel.name}")
                expect(page).to have_content("Number of Guests: 1")
            end
        end
    end
end