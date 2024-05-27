require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  before(:each) do
    @hotel_1 = Hotel.create!(name: "Fancy Pants Hotel", location: "Miami")
    @room_1 = @hotel_1.rooms.create!(id: 1, rate: 250, suite: "Penthouse")

    @guest_1 = Guest.create!(id: 1, name: "Jim", nights: 3)
    @guest_2 = Guest.create!(id: 2, name: "Miranda", nights: 3)

    GuestRoom.create!(guest_id: @guest_1.id, room_id: @room_1.id)
    GuestRoom.create!(guest_id: @guest_2.id, room_id: @room_1.id)
  end

  describe "instance methods" do
    describe ".guest_count" do
      it "returns the count of guests for that room" do
        expect(@room_1.guest_count).to eq(2)
      end
    end
  end
end