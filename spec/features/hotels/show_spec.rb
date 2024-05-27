require "rails_helper"

RSpec.describe "the hotel show page" do
  before :each do
    @hotel1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @hotel2 = Hotel.create!(name: 'Reverb Hill Lodge', location: 'Reverb Hill')
    @room1 = Room.create!(rate: 125, suite: "Presidential", hotel_id: @hotel1.id)
    @room2 = Room.create!(rate: 75, suite: "Junior", hotel_id: @hotel1.id)
    @room3 = Room.create!(rate: 150, suite: "Presidential", hotel_id: @hotel2.id)
    @room4 = Room.create!(rate: 100, suite: "Junior", hotel_id: @hotel2.id)
    @guest1 = Guest.create!(name: 'Charlize Theron', nights: 3)
    @guest2 = Guest.create!(name: 'Tom Hardy', nights: 4)
    @guest3 = Guest.create!(name: 'Anya Taylor-Joy', nights: 1)
    @guest4 = Guest.create!(name: 'Chris Hemsworth', nights: 2)
    GuestRoom.create(room_id: @room1.id, guest_id: @guest1.id)
    GuestRoom.create(room_id: @room2.id, guest_id: @guest1.id)
    GuestRoom.create(room_id: @room1.id, guest_id: @guest2.id)
    GuestRoom.create(room_id: @room3.id, guest_id: @guest3.id)
    GuestRoom.create(room_id: @room4.id, guest_id: @guest3.id)
    GuestRoom.create(room_id: @room3.id, guest_id: @guest4.id)
  end

  it "shows list of unique guest names" do
    visit "/hotels/#{@hotel1.id}"

    expect(page).to have_content("Echo Mountain Inn")
    expect(page).to have_content("Charlize Theron", count: 1)
    expect(page).to have_content("Tom Hardy", count: 1)
  end
end