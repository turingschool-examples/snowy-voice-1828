class AddGuestRoomsToRooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :rooms, :guest_rooms, null: false, foreign_key: true
  end
end
