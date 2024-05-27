class Guest < ApplicationRecord
    has_many :guest_rooms
    has_many :rooms, through: :guest_rooms

    def add_room(room_id)
        self.rooms << Room.find(room_id)
    end
end