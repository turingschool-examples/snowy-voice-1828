require "rails_helper"

RSpec.describe "the guest show" do
  before(:each) do
    @guest = Guest.create!(name: "Frank Sinatra")
    @hotel = Hotel.create!(name: "The St Laurent", location: "Asbury Park")
    @room = @hotel.rooms.create!(rate: 1000, suite: "Presidential")
    @guest_room = GuestRoom.create!(guest: @guest, room: @room)
  end

# Story 1 - Guest Show
# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the 
# name of the hotel that it belongs to.
  it 'shows the guest name and all of the rooms they stayed in' do
    visit "/guests/#{@guest.id}"
    save_and_open_page

    expect(page).to have_content(@guest.name)
    expect(page).to have_content(@room.id)
    expect(page).to have_content(@room.rate)
    expect(page).to have_content(@room. suite)
    expect(page).to have_content(@hotel.name)
  end

end