require "rails_helper"

RSpec.describe Guest do
  it "shows the guest show page including guest name the rooms they stayed in including the room's suite, nightly rate and the name of the hotel" do
    @guest1 = Guest.create!(name: "George Russell", nights: 2 )
    @hotel1 = Hotel.create!(name: "Echo Mountain Inn", location: 'Echo Mountain')
    @room1 = Room.create!(rate: 100, suite: 'Standard', hotel_id: "#{@hotel1.id}")
    GuestRoom.create!(guest: @guest1, room: @room1)
    
    visit "/guests/#{@guest1.id}"
    expect(page).to have_content("George Russell")
    expect(page).to have_content("100")
    expect(page).to have_content("Standard")
    expect(page).to have_content("Echo Mountain Inn")
    # save_and_open_page

  end


#   Story 2
# Add a Guest to a Room

# As a visitor
# When I visit a guest's show page
# Then I see a form to add a room to this guest.
# When I fill in a field with the id of an existing room
# And I click submit
# Then I am redirected back to the guest's show page
# And I see the room now listed under this guest's rooms.
# (You do not have to test for a sad path, 
# for example if the ID submitted is not an existing room)
  it "Can add a room to the guest" do
    @guest1 = Guest.create!(name: "George Russell", nights: 2 )
    @hotel1 = Hotel.create!(name: "Echo Mountain Inn", location: 'Echo Mountain')
    @room1 = Room.create!(rate: 100, suite: 'Standard', hotel_id: "#{@hotel1.id}")
    @room2 = Room.create!(rate: 150, suite: 'Deluxe Room', hotel_id: "#{@hotel1.id}")
    GuestRoom.create!(guest: @guest1, room: @room1)
    
    visit "/guests/#{@guest1.id}"
    # save_and_open_page
    expect(page).to have_button("Add Room")
    fill_in :room_id, with:"#{@room2.id}"
    click_button "Add Room"
    expect(current_path).to eq("/guests/#{@guest1.id}")
    expect(page).to have_content('Deluxe Room')
    expect(page).to have_content(150)
  end
end