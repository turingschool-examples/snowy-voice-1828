class CreateGuestRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :guest_rooms do |t|
      t.integer :guest_id
      t.integer :room_id
      t.timestamps
    end
  end
end
