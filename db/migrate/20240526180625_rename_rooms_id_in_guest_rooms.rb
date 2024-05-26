class RenameRoomsIdInGuestRooms < ActiveRecord::Migration[7.1]
  def change
    rename_column :guest_rooms, :rooms_id, :room_id
  end
end
