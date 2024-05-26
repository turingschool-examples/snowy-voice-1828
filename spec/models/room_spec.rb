require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe "instance methods" do
    describe "#guests_count" do
      it "can count all guests" do
        @hotel1 = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
        @room1 = Room.create!(rate: 125, suite: "Presidential", hotel_id: @hotel1.id)
        @guest1 = Guest.create!(name: 'Charlize Theron', nights: 3)
        @guest2 = Guest.create!(name: 'Tom Hardy', nights: 4)
        GuestRoom.create(room_id: @room1.id, guest_id: @guest1.id)
        GuestRoom.create(room_id: @room1.id, guest_id: @guest2.id)

        expect(@room1.guests_count).to eq(2)
      end
    end
  end
end