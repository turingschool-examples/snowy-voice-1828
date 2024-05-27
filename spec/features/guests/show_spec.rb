require "rails_helper"

RSpec.describe "Guests Show Page" do
  before(:each) do
    @guest_1 = Guest.create!(id: 1, name: "Jim", nights: 3)

    @hotel_1 = Hotel.create!(name: "Fancy Pants Hotel", location: "Miami")
    @room_1 = @hotel_1.rooms.create!(id: 1, rate: 250, suite: "Penthouse")
    @room_2 = @hotel_1.rooms.create!(id: 2, rate: 150, suite: "Third Floor Corner View")

    GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_2.id)

    visit("/guests/#{@guest_1.id}")
  end

  describe "As a visitor, when I visit the guests show page" do
    it "shows the guest's name" do
      expect(page).to have_content("Guest Name: #{@guest_1.name}")
    end

    it "shows a list of all rooms that guest stayed in" do
      within("div#rooms_list") do
        expect(page).to have_content("Suite: #{@room_1.suite}")
        expect(page).to have_content("Rate: #{@room_1.rate}")
        expect(page).to have_content("Hotel Name: #{@hotel_1.name}")

        expect(page).to have_content("Suite: #{@room_2.suite}")
        expect(page).to have_content("Rate: #{@room_2.rate}")
        expect(page).to have_content("Hotel Name: #{@hotel_1.name}")
      end
    end
  end
end