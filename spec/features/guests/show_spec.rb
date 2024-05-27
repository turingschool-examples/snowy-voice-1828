require "rails_helper"

RSpec.describe "Guest Show Page" do
    it "can display the guest and the list of rooms they've stayed in" do
        hotel = Hotel.create!(name: "Caesar's")
        room1 = hotel.rooms.create!(room_type: "Presidential", nightly_rate: 400)
        room2 = hotel.rooms.create!(room_type: "Deluxe", nightly_rate: 200)
        guest = Guest.create!(name: "John Lennon")
        Booking.create!(guest: guest, room: room1)
        Booking.create!(guest: guest, room: room2)

        visit "/guests/#{guest.id}"

        expect(page).to have_content("John Lennon")
        expect(page).to have_content("Presidential")
        expect(page).to have_content("400")
        expect(page).to have_content("Deluxe")
        expect(page).to have_content("200")
        expect(page).to have_content("Caesar's")
    end
end