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
      # save_and_open_page
      expect(page).to have_content(room_1.suite)
      expect(page).to have_content(room_1.rate)
      expect(page).to have_content(room_1.hotel.name)
    end
  
    # Story 2
    # Add a Guest to a Room
    # As a visitor
    # When I visit a guest's show page
    # Then I see a form to add a room to this guest.
    # When I fill in a field with the id of an existing room
    # And I click submit
    # Then I am redirected back to the guest's show page
    # And I see the room now listed under this guest's rooms.
    # (You do not have to test for a sad path, for example if the ID submitted is not an existing room)
    it "I see a form to add a room to this guest" do
      guest_1 = Guest.create!(name: "Jim James")
      hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
      room_1 = hotel_1.rooms.create!(rate: 125, suite: "Presidential")
      hotel_2 = Hotel.create!(name: 'White Lotus', location: 'Maui')
      room_2 = hotel_2.rooms.create!(rate: 1500, suite: "Pineapple", id: 999)
      RoomsGuest.create!(room: room_1, guest: guest_1)
      
      visit "/guests/#{guest_1.id}"
      # save_and_open_page
      expect(page).to have_content("Add a room")
			fill_in :room_id, with: "999"
			click_button("Submit")
      save_and_open_page
      expect(current_path).to eq("/guests/#{guest_1.id}")
      expect(page).to have_content("White Lotus")
      expect(page).to have_content("Pineapple")
    end

  end
end