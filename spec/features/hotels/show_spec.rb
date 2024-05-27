require "rails_helper"

RSpec.describe "Hotels Show Page" do
  before(:each) do
    @hotel_1 = Hotel.create!(name: "Fancy Pants Hotel", location: "Miami")

    @guest_1 = Guest.create!(id: 1, name: "Jim", nights: 3)
    @guest_2 = Guest.create!(id: 2, name: "Miranda", nights: 3)
    @guest_3 = Guest.create!(id: 3, name: "Tim", nights: 3)
    @guest_4 = Guest.create!(id: 4, name: "Shandra", nights: 3)

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

    visit("/hotels/#{@hotel_1.id}")
  end

  describe "As a visitor, when I visit a hotel's show page" do
    # it "shows a unique list of all guests that have stayed at the hotel" do
    #   within("div#guest_list") do
    #     expect(page).to have_content("List of Guests:")
    #     expect(page).to have_content("Name: #{@guest_1.name}")
    #     expect(page).to have_content("Name: #{@guest_2.name}")
    #     expect(page).to have_content("Name: #{@guest_3.name}")
    #     expect(page).to have_content("Name: #{@guest_4.name}")
    #   end
    # end
  end
end