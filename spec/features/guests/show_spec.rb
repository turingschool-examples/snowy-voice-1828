require "rails_helper"

RSpec.describe "the guest show" do
  describe "when I visit a guest's show page" do
    it "shows the guest's name" do
    
      hotel1 = Hotel.create(name: "Expensive Hotel", location: "A Very Expensive Place")
      hotel2 = Hotel.create(name: "Luxury Inn", location: "Luxury Street")

      room1 = Room.create(rate: 250, suite: "Emperor", hotel: hotel1)
      room2 = Room.create(rate: 125, suite: "Presidential", hotel: hotel1)
      room3 = Room.create(rate: 300, suite: "Royal", hotel: hotel2)
      room4 = Room.create(rate: 150, suite: "Deluxe", hotel: hotel2)

      guest1 = Guest.create(name: "Joe the Man", nights: 3)

      GuestRoom.create(guest: guest1, room: room1)
      GuestRoom.create(guest: guest1, room: room2)
      GuestRoom.create(guest: guest1, room: room3)

      guest2 = Guest.create(name: "Jane the Woman", nights: 2)

      GuestRoom.create(guest: guest2, room: room3)
      GuestRoom.create(guest: guest2, room: room4)


      visit "/guests/#{guest1.id}"

      expect(page).to have_content(guest1.name)
      expect(page).to have_content(room1.rate)
      expect(page).to have_content(room1.suite)
      expect(page).to have_content(room1.hotel.name)

      expect(page).to have_content(room2.rate)
      expect(page).to have_content(room2.suite)
      expect(page).to have_content(room2.hotel.name)

      expect(page).to have_content(room3.rate)
      expect(page).to have_content(room3.suite)
      expect(page).to have_content(room3.hotel.name)

      visit "/guests/#{guest2.id}"

      expect(page).to have_content(guest2.name)
      expect(page).to have_content(guest2.nights)
      expect(page).to have_content(room3.rate)
      expect(page).to have_content(room3.suite)
      expect(page).to have_content(room3.hotel.name)

      expect(page).to have_content(room4.rate)
      expect(page).to have_content(room4.suite)
      expect(page).to have_content(room4.hotel.name)
    end
  end
end
