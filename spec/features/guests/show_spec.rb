require "rails_helper"

RSpec.describe "Guests Show Page" do
  before(:each) do
    @guest_1 = Guest.create!(id: 1, name: "Jim", nights: 3)

    @hotel_1 = Hotel.create!(name: "Fancy Pants Hotel", location: "Miami")
    @room_1 = @hotel_1.rooms.create!(id: 1, rate: 250, suite: "Penthouse")
    @room_2 = @hotel_1.rooms.create!(id: 2, rate: 150, suite: "Third Floor Corner View")
    @room_3 = @hotel_1.rooms.create!(id: 3, rate: 100, suite: "First Floor")

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

    it "shows a form to add a room to this guest" do
      within("div#add_room_form") do
        expect(page).to have_selector("form")
      end
    end

    it "redirects back to the guest show page when existing room id is entered" do
      fill_in("Room ID", with: 3)

      click_button("Submit")

      expect(current_path).to eq("/guests/#{@guest_1.id}")
    end

    it "shows the new room under the guest's rooms" do
      fill_in("Room ID", with: 3)

      click_button("Submit")

      within("div#rooms_list") do
        expect(page).to have_content("Suite: #{@room_3.suite}")
        expect(page).to have_content("Rate: #{@room_3.rate}")
        expect(page).to have_content("Hotel Name: #{@hotel_1.name}")
      end
      save_and_open_page
    end
  end
end