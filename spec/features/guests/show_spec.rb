require "rails_helper"

RSpec.describe "the guests show page" do

  before :each do
    @hotel = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @room1= @hotel.rooms.create!(rate: 125, suite: "Presidential")
    @room2= @hotel.rooms.create!(rate: 100, suite: "Junior")
    @guest1 = Guest.create!(name: 'Charlize Theron', nights: 3)
  end
# Story 1
# Guest Show

# As a visitor
# When I visit a guest's show page
# I see the guest's name
# And I see a list of all the rooms they've stayed in
# including the room's suite, nightly rate, and the name of the hotel that it belongs to.
  describe "As a Visitor" do
    it "can see guest's name, rooms, and room info" do
      GuestRoom.create!(guest_id: @guest1.id, room_id: @room1.id)
      GuestRoom.create!(guest_id: @guest1.id, room_id: @room2.id)

      visit "/guests/#{@guest1.id}"
      # save_and_open_page
      expect(page).to have_content("Name: Charlize Theron")
      expect(page).to have_content("Suite: #{@room1.suite}")
      expect(page).to have_content("Suite: #{@room2.suite}")
      expect(page).to have_content("Hotel: #{@hotel.name}")
      expect(page).to have_content("Nightly Rate: #{@room1.rate}")
      expect(page).to have_content("Nightly Rate: #{@room2.rate}")
    end

    it "can add guest to a room" do
      visit "/guests/#{@guest1.id}"

      save_and_open_page
      expect(find("form")).to have_content("Add room")

      fill_in "room", with: "#{@room1.id}"
      click_on "Submit"
      save_and_open_page
      expect(page).to have_content("Suite: #{@room1.suite}")
      expect(page).to have_content("Hotel: #{@hotel.name}")
      expect(page).to have_content("Nightly Rate: #{@room1.rate}")
    end
  end
end