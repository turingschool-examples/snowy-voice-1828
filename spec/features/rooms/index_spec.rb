require "rails_helper"

RSpec.describe "Rooms Index Page" do
    it "should show all rooms" do
        hotel1 = Hotel.create!("Caesar's")
        hotel2 = Hotel.create!("Hotel California")

        room1 = hotel1.rooms.create!(suite: "Presidential", rate: 400)
        room2 = hotel1.rooms.create!(suite: "Deluxe", rate: 200)
        room3 = hotel2.rooms.create!(suite: "Colita Cabin", rate: 800)

        guest1 = Guest.create!(name: "John Lennon")
        guest2 = Guest.create!(name: "Steven Tyler")
        guest3 = Guest.create!(name: "David Bowie")

        Booking.create!(guest: guest1, room: room1)
        Booking.create!(guest: guest2, room: room1)
        Booking.create!(guest: guest3, room: room2)

        visit "rooms"

        within("#room-#{room1.id}") do
          expect(page).to have_content("Presidential")
          expect(page).to have_content("400")
          expect(page).to have_content("Caesar's")
          expect(page).to have_content("2 guests")
        end

        within("#room-#{room2.id}") do
          expect(page).to have_content("Deluxe")
          expect(page).to have_content("200")
          expect(page).to have_content("Caesar's")
          expect(page).to have_content("1 guest")
        end

        within("#room-#{room3.id}") do
          expect(page).to have_content("Colita Cabin")
          expect(page).to have_content("800")
          expect(page).to have_content("Hotel California")
          expect(page).to have_content("0 guests")
        end
    end
end