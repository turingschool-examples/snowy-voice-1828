require "rails_helper"

RSpec.describe "the rooms index page" do

  before :each do
    @hotel = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @room1= @hotel.rooms.create!(rate: 125, suite: "Presidential")
    @room2= @hotel.rooms.create!(rate: 100, suite: "Junior")
    @guest1 = Guest.create!(name: 'Charlize Theron', nights: 3)
    @guest2 = Guest.create!(name: 'Tony Stark', nights: 4)
  end

  # Story 3
  # Rooms Index
  
  # As a visitor
  # When I visit the rooms index page
  # Then I see a list of all rooms
  # including the room's suite, nightly rate, and the name of the hotel that it belongs to
  # and the number of guests that have stayed in that room.

  describe "As a Visitor" do
    it "can see room info and guest count" do
      GuestRoom.create!(guest_id: @guest1.id, room_id: @room1.id)
      GuestRoom.create!(guest_id: @guest1.id, room_id: @room2.id)
      GuestRoom.create!(guest_id: @guest2.id, room_id: @room2.id)

      visit "/rooms"

      # within "room-#{@room1.id}" do
        expect(page).to have_content("Suite: #{@room1.suite}")
        expect(page).to have_content("Nightly Rate: #{@room1.rate}")
        expect(page).to have_content("Hotel: #{@hotel.name}")
        expect(page).to have_content("Guest Count: 1")
      # end
      
      # within "room-#{@room2.id}" do
        expect(page).to have_content("Suite: #{@room2.suite}")
        expect(page).to have_content("Nightly Rate: #{@room2.rate}")
        expect(page).to have_content("Guest Count: 2")
      # end
      # i was having issues with syntax creating specific id for each div containers in the view"
      # <div id="room-<% room.id %>">
    end
  end
end