require "rails_helper"

RSpec.describe "guest show page", type: :feature do

  before(:each) do
    hotel1 = Hotel.create(name: "Grand Hotel", location: "New York")
    hotel2 = Hotel.create(name: "Sea View Resort", location: "Miami")
    hotel3 = Hotel.create(name: "Mountain Inn", location: "Denver")

    Room.create(rate: 200, suite: "Single", hotel: hotel1)
    Room.create(rate: 300, suite: "Double", hotel: hotel1)
    Room.create(rate: 400, suite: "Suite", hotel: hotel1)
    Room.create(rate: 150, suite: "Single", hotel: hotel2)
    Room.create(rate: 250, suite: "Double", hotel: hotel2)
    Room.create(rate: 350, suite: "Suite", hotel: hotel2)
    Room.create(rate: 100, suite: "Single", hotel: hotel3)
    Room.create(rate: 200, suite: "Double", hotel: hotel3)
    Room.create(rate: 300, suite: "Suite", hotel: hotel3)

    Guest.create(name: "Alice Johnson", nights: 3)
    Guest.create(name: "Bob Smith", nights: 2)
    Guest.create(name: "Charlie Brown", nights: 5)
    Guest.create(name: "Diana Ross", nights: 1)
    Guest.create(name: "Ethan Hunt", nights: 4)
  end

  # As a visitor
  # When I visit a guest's show page
  # I see the guest's name
  # And I see a list of all the rooms they've stayed in
  # including the room's suite, nightly rate, and the name of the hotel that it belongs to.
  describe "as a visitor" do
    describe "when I visit a guest's show page" do
      it "I see the guest's name, and I see a list of all the rooms they've stayed in, including the room's suite, nightly rate, and the name of the hotel that it belongs to" do
        visit "/guests"

        expect(page).to have_content(guest.name)
        expect(page).to have_content(guest.room)
        expect(page).to have_content(hotel.type)
        expect(page).to have_content(hotel.rating)
        expect(page).to have_content(hotel.name)
      end
    end
  end

end
