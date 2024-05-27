require "rails_helper"

RSpec.describe "Rooms Index Page" do
  before(:each) do
    @guest_1 = Guest.create!(id: 1, name: "Jim", nights: 3)
    @guest_2 = Guest.create!(id: 2, name: "Miranda", nights: 3)
    @guest_3 = Guest.create!(id: 3, name: "Jane", nights: 3)
    @guest_4 = Guest.create!(id: 4, name: "Barry", nights: 3)

    @hotel_1 = Hotel.create!(name: "Fancy Pants Hotel", location: "Miami")
    @room_1 = @hotel_1.rooms.create!(id: 1, rate: 250, suite: "Penthouse")
    @room_2 = @hotel_1.rooms.create!(id: 2, rate: 150, suite: "Third Floor Corner View")
    @room_3 = @hotel_1.rooms.create!(id: 3, rate: 100, suite: "First Floor")

    GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_1.id)

    GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_2.id)
    GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_2.id)

    GuestRoom.create!(guest_id: @guest_3.id, room_id: @room_3.id)
    GuestRoom.create!(guest_id: @guest_4.id, room_id: @room_3.id)
    GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_3.id)

    visit("/rooms")
  end

  describe "As a visitor, when I visit the rooms index page" do
    it "shows a list of all rooms" do
      within("div#rooms_list") do
        expect(page).to have_content("Suite: #{@room_1.suite}")
        expect(page).to have_content("Rate: #{@room_1.rate}")
        expect(page).to have_content("Hotel Name: #{@hotel_1.name}")

        expect(page).to have_content("Suite: #{@room_2.suite}")
        expect(page).to have_content("Rate: #{@room_2.rate}")
        expect(page).to have_content("Hotel Name: #{@hotel_1.name}")

        expect(page).to have_content("Suite: #{@room_3.suite}")
        expect(page).to have_content("Rate: #{@room_3.rate}")
        expect(page).to have_content("Hotel Name: #{@hotel_1.name}")
      end
    end

    it "shows the number of guests that have stayed in that room" do
      within("div#rooms_list") do
        expect(page).to have_content("Number of Guests: #{@room_1.guest_count}")
        expect(page).to have_content("Number of Guests: #{@room_2.guest_count}")
        expect(page).to have_content("Number of Guests: #{@room_3.guest_count}")
      end
    end
  end
end