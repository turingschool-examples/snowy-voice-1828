require "rails_helper"

RSpec.describe Guest, type: :model do
    describe "relationships" do
        it { should have_many :guest_rooms }
        it { should have_many(:rooms).through(:guest_rooms) }
    end

    describe "instance methods" do
        describe "#add_room" do
            it "adds a room to the guest's rooms" do
                hotel = Hotel.create!(name: "Marriott", location: "Jakarta")
                room = hotel.rooms.create!(suite: "A1", rate: 100)
                guest = Guest.create!(name: "Garrett Bowman", nights: 3)

                guest.add_room(room.id)

                expect(guest.rooms).to eq([room])
            end
        end
    end
end