require "rails_helper"

RSpec.describe Room do

  # Story 3
  # Rooms Index
  
  # As a visitor
  # When I visit the rooms index page
  # Then I see a list of all rooms
  # including the room's suite, nightly rate, 
  # and the name of the hotel that it belongs to
  # and the number of guests that have stayed in that room.

  it "shows the full Room index" do
    @guest1 = Guest.create!(name: "George Russell", nights: 2 )
    @hotel1 = Hotel.create!(name: "Echo Mountain Inn", location: 'Echo Mountain')
    @room1 = Room.create!(rate: 100, suite: 'Standard', hotel_id: "#{@hotel1.id}")
    @room2 = Room.create!(rate: 150, suite: 'Deluxe Room', hotel_id: "#{@hotel1.id}")
    GuestRoom.create!(guest: @guest1, room: @room1)

    visit "/rooms"

    expect(page).to have_content("Standard")
    expect(page).to have_content(100)
    expect(page).to have_content("Deluxe Room")
    expect(page).to have_content(150)
    expect(page).to have_content("Echo Mountain Inn")
    expect(page).to have_content(1)

  end
end