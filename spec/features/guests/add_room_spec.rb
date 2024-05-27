require "rails_helper"

RSpec.describe "Add a Room to the guest" do
    it "should add the room to the guest and show it on the show page" do
        hotel = Hotel.create!(name: "Caesar's")
        room1 = hotel.rooms.create!(suite: "Presidential", rate: 400)
        room2 = hotel.rooms.create!(suite: "Deluxe", rate: 200)
        guest = Guest.create!(name: "John Lennon")
        Booking.create!(guest: guest, room: room1)

        visit "/guests/#{guest.id}"

        expect(page).to have_content("John Lennon")
        expect(page).to have_content("Presidential")
        expect(page).to have_content("400")
        expect(page).not_to have_content("Deluxe")
        expect(page).not_to have_content("200")

        fill_in "Room ID", with: room2.id
        click_button "Add Room"

        expect(current_path).to eq("/guests/#{guest.id}")
        expect(page).to have_content("Deluxe")
        expect(page).to have_content("200")
        expect(page).to have_content("Caesar's")
    end
end