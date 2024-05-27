require "rails_helper"

RSpec.describe "Guest Show Page" do
    describe "As a visitor" do
        scenario "I see the guest's name and a list of all the rooms they've stayed in, including the room's suite, nightly rate, and the name of the hotel that it belongs to." do
            hotel = Hotel.create!(name: "Marriott", location: "Jakarta")
            room = hotel.rooms.create!(suite: "A1", rate: 100)
            room2 = hotel.rooms.create!(suite: "A2", rate: 150)
            guest = Guest.create!(name: "Garrett Bowman", nights: 3)
            guest.rooms << [room, room2]


            visit "/guests/#{guest.id}"

            expect(page).to have_content(guest.name)
            expect(page).to have_content(room.suite)
            expect(page).to have_content(room.rate)
            expect(page).to have_content(hotel.name)
            expect(page).to have_content(room2.suite)
            expect(page).to have_content(room2.rate)
            expect(page).to have_content(hotel.name)

        end
    end
end
