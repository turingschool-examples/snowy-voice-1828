require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guests }
  end

  describe "instance methods" do
    describe "#number_of_guests_stayed" do
      it "returns the number of guests that have stayed in that room" do
        hotel = Hotel.create!(name: "Marriott", location: "Jakarta")
        room = hotel.rooms.create!(suite: "A1", rate: 100)
        room2 = hotel.rooms.create!(suite: "A2", rate: 150)

        guest = Guest.create!(name: "Garrett Bowman", nights: 3)
        guest2 = Guest.create!(name: "John Banks", nights: 2)
        guest3 = Guest.create!(name: "Will James", nights: 5)

        guest.add_room(room.id)

        guest2.add_room(room.id)

        guest3.add_room(room2.id)

        expect(room.number_of_guests_stayed).to eq(2)
        expect(room2.number_of_guests_stayed).to eq(1)
      end
    end
  end
end