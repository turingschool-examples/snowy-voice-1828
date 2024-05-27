require "rails_helper"

RSpec.describe "the guest show" do
  describe "when I visit a guest's show page" do
    it "shows the guest's name" do
      guest1 = Guest.create(name: "Joe the Man", nights: 3)
      hotel = Hotel.create(name: "Exspensive Hotel", location: "A Very Expensive Place")

      room1 = Room.create(rate: 250, suite: "Emperor", guest_id: guest1.id)
      room2 = Room.create(rate: 125, suite: "Presidential", guest_id: guest1.id )

      visit "/guests/#{guest.id}"

      expect(page).to have_content(guest.name)
      expect(page).to have_content(guest.nights)
      expect(page).to have_content(guest.room1.rate)
      expect(page).to have_content(guest.room1.suite)
      expect(page).to have_content(guest.room1.hotel.name)
    end
  end
end
