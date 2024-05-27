require "rails_helper"

RSpec.describe Room, type: :model do
  describe "relationships" do
    it { should belong_to :hotel }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  before :each do
    @hotel = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
    @room1= @hotel.rooms.create!(rate: 125, suite: "Presidential")
    @room2= @hotel.rooms.create!(rate: 100, suite: "Junior")
    @guest1 = Guest.create!(name: 'Charlize Theron', nights: 3)
    @guest2 = Guest.create!(name: 'Tony Stark', nights: 4)
  end

  describe "#instance methods" do
    it "can count room's guests" do
      GuestRoom.create!(guest_id: @guest1.id, room_id: @room1.id)
      GuestRoom.create!(guest_id: @guest1.id, room_id: @room2.id)
      GuestRoom.create!(guest_id: @guest2.id, room_id: @room2.id)

      expect(@room1.guest_count).to eq(1)
      expect(@room2.guest_count).to eq(2)
    end
  end
end