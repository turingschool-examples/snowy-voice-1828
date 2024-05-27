require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it { should belong_to(:hotel) }
    it { should have_many :guest_rooms }
    it { should have_many(:guests).through(:guest_rooms) }
  end

  describe 'instance methods' do
    it 'can count all guests that have stayed in a room' do
      @hotel = Hotel.create(name: 'Hilton', location: 'Denver')
      @room = @hotel.rooms.create(rate: 125, suite: 'presidential', hotel_id: @hotel.id)
      @room2 = @hotel.rooms.create(rate: 125, suite: 'King', hotel_id: @hotel.id)
      @guest = Guest.create(name: 'John', nights: 3)
      @guest2 = Guest.create(name: 'Samantha', nights: 4)
      @guest3 = Guest.create(name: 'Hank', nights: 2)
      @guest_room = GuestRoom.create(guest_id: @guest.id, room_id: @room.id)
      @guest_room2 = GuestRoom.create(guest_id: @guest2.id, room_id: @room.id)
      @guest_room3 = GuestRoom.create(guest_id: @guest3.id, room_id: @room2.id)

      expect(@room.guest_count).to eq(2)
    end
  end
end
