require "rails_helper"

# Extension

# As a visitor,
# When I visit a hotel's show page,
# Then I see a unique list of all guests that have stayed at this hotel.

RSpec.describe "the hotel show page" do
  context "as a visitor" do 
    it "I see a unique list of all guests that have stayed at this hotel" do 
      hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
      room_2 = hotel_1.rooms.create!(rate: 1500, suite: "Honeymoon")
      guest_1 = Guest.create!(name: "Jim James")
      guest_2 = Guest.create!(name: "Bob Dylan")
      RoomsGuest.create!(room: room_1, guest: guest_1)
      RoomsGuest.create!(room: room_1, guest: guest_2)
      RoomsGuest.create!(room: room_2, guest: guest_1)
      RoomsGuest.create!(room: room_2, guest: guest_2)

      visit "/hotels/#{hotel_1.id}"
      save_and_open_page
      expect(page).to have_content("Unique guests: Bob Dylan, Jim James")
    end
  end
end